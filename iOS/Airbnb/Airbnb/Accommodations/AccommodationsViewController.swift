//
//  AccommodationsViewController.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/21.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import Combine

final class AccommodationsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = dataSource
            tableView
                .register(AccommodationsHeaderView.self,
                          forHeaderFooterViewReuseIdentifier: AccommodationsHeaderView.identifier)
        }
    }
    @IBOutlet var conditionButtons: [UIButton]!
    @IBOutlet weak var searchTextField: SearchTextField!
    
    // MARK: - Properties
    private var dataSource: AccommodationsDataSource = .init()
    private var subscriptions: Set<AnyCancellable> = .init()
    private var previousCount: Int = .zero
    private var lock: Bool = true
    @Published var searchWord: String?
    var isSearching: Bool = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch(provider: AirbnbNetworkImpl(), endpoint: Endpoint(path: .main))
        bindViewModelToView()
        bindSearchTextField()
        bindSearchRequest()
    }
    
    @IBAction func showConditionViewController(_ sender: UIButton) {
        let conditionViewControllers = [0: DatePickerViewController(),
                                        1: PersonnelSelectorViewController(),
                                        2: ConditionSettingViewController()]
        
        guard let buttonIndex = conditionButtons.firstIndex(of: sender),
            let conditionSettingViewController = conditionViewControllers[buttonIndex] else { return }
        conditionSettingViewController.modalPresentationStyle = .overFullScreen
        present(conditionSettingViewController,
                animated: true)
    }
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - Methods
    private func fetch(provider: AirbnbNetwork, endpoint: RequestPorviding) {
        provider
            .request([Accommodations].self,
                     requestProviding: endpoint)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {
                guard case .failure(let error) = $0 else { return }
                self.errorAlert(message: error.message)
            },
                  receiveValue: { accommodations in
                    self.previousCount = self.dataSource.accomodations.count
                    self.dataSource.accomodations.append(contentsOf: accommodations)
            })
            .store(in: &subscriptions)
    }
    
    private func search(provider: AirbnbNetwork, endpoint: RequestPorviding) {
        provider
            .request([Accommodations].self,
                     requestProviding: endpoint)
            .sink(receiveCompletion: {
                guard case .failure(let error) = $0 else { return }
                self.errorAlert(message: error.message)
            },
                  receiveValue: { accommodations in
                    self.previousCount = .zero
                    self.dataSource.accomodations = accommodations
            })
            .store(in: &subscriptions)
    }
    
    private func bindViewModelToView() {
        dataSource.$accomodations
            .receive(on: RunLoop.main)
            .sink(receiveValue: { accommodations in
                guard !self.dataSource.accomodations.isEmpty else {
                    self.tableView.reloadData()
                    return
                }
                if self.isSearching {
                    self.tableView.reloadData()
                } else {
                    let indexPathArray = (self.previousCount..<self.dataSource.accomodations.count).map { IndexPath(row: $0, section: 1) }
                    if self.previousCount == 0 {
                        self.tableView.reloadData()
                    } else {
                        self.tableView.insertRows(at: indexPathArray, with: .automatic)
                    }
                    self.fetchImages(accommodations: accommodations)
                    self.lock = true
                }
                
            })
            .store(in: &subscriptions)
    }
    
    private func fetchImages(accommodations: [Accommodations]) {
        let imagePublishers = accommodations.map { item -> (Accommodations, [AnyPublisher<(String, Data), AirbnbNetworkError>] )in
            let publishers = item.images
                .filter { !ImageManager.fileExist(fileName: $0) }
                .map { AirbnbNetworkImpl().load(from: $0) }
            return (item, publishers)
        }
        
        imagePublishers.forEach { item, publishers in
            Publishers.MergeMany(publishers)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { _ in
                    guard let index = accommodations.firstIndex(of: item) else { return }
                    self.tableView.reloadRows(at: [IndexPath(item: index, section: 1)],
                                              with: .automatic)
                }) { url, data in
                    ImageManager.cache(imageData: data,
                                       urlString: url)
            }.store(in: &subscriptions)
        }
    }
    
    private func errorAlert(message: String?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Close", style: .cancel)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    private func bindSearchTextField() {
        searchTextField.notificationPublisher
            .sink(receiveValue: { notification in
                guard let textField = notification.object as? UITextField else { return }
                self.searchWord = textField.text
            }).store(in: &subscriptions)
    }
    
    private func bindSearchRequest() {
        $searchWord
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink {
                guard let word = $0 else { return }
                self.isSearching = !word.isEmpty
                self.search(provider: AirbnbNetworkImpl(),
                            endpoint: Endpoint(path: .main,
                                               queryItems: [.search: word]))
        }
        .store(in: &subscriptions)
    }
}

// MARK: - UITableView
// MARK: Delegate
extension AccommodationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == AccommodationsHeaderView.section else { return nil }
        
        return tableView
            .dequeueReusableHeaderFooterView(withIdentifier: AccommodationsHeaderView.identifier)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == AccommodationsHeaderView.section else { return .zero }
        
        return AccommodationsHeaderView.height
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? AccommodationsHeaderView else { return }
        headerView
            .configure(text: "날짜와 인원을 선택하시면 가격별 숙소를 추천해드립니다.")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.contentOffset.y + scrollView.bounds.size.height > scrollView.contentSize.height + 10.0,
            lock,
            !isSearching else { return }
        lock = false
        fetch(provider: AirbnbNetworkImpl(), endpoint: Endpoint(path: .main, queryItems: [.offset: "\(dataSource.accomodations.count)"]))
    }
}

extension AccommodationsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
