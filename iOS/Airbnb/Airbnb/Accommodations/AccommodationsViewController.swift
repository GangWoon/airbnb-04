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
    
    // MARK: - Properties
    private var dataSource: AccommodationsDataSource = .init()
    private var subscriptions: Set<AnyCancellable> = .init()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch(provider: AirbnbNetworkImpl(), endpoint: Endpoint(path: .main))
        bindViewModelToView()
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
                  receiveValue: { accomodations in
                    self.dataSource.accomodations = accomodations
            })
            .store(in: &subscriptions)
    }
    
    private func bindViewModelToView() {
        dataSource.$accomodations
            .receive(on: RunLoop.main)
            .sink {
                self.tableView.reloadData()
                self.fetchImages(accommodations: $0)
        }
        .store(in: &subscriptions)
    }
    
    private func fetchImages(accommodations: [Accommodations]) {
        accommodations.forEach {
            $0.images.forEach {
                let url = $0
                AirbnbNetworkImpl().load(from: url)
                    .sink(receiveCompletion: {
                        guard case .failure(let error) = $0 else { return }
                        self.errorAlert(message: error.message)
                    },
                          receiveValue: { data in
                            let name = url.filterRegex(.imageName)
                                .replacingOccurrences(of: "?aki_policy=large",
                                                      with: "")
                            ImageManager.cache(imageData: data,
                                               name: name)
                            
                    })
                    .store(in: &subscriptions)
            }
        }
    }
    
    private func errorAlert(message: String?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Close", style: .cancel)
        alert.addAction(cancel)
        present(alert, animated: true)
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
}

