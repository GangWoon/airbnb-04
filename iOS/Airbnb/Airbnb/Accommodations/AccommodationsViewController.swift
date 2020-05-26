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
    
    // MARK: - Properties
    private var dataSource: AccommodationsDataSource = .init()
    private var subscriptions: Set<AnyCancellable> = .init()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMock()
        bindViewModelToView()
    }
    
    // MARK: - Methods
    private func fetchMock() {
        AirbnbMockNetworkImpl
            .request([Accommodations].self,
                     requestProviding: Endpoint(path: .main))
            .sink(receiveCompletion: { _ in
                // TODO: 에러 핸들링
            },
                  receiveValue: { accomodations in
                    self.dataSource.accomodations = accomodations
            })
            .cancel()
    }
    
    private func bindViewModelToView() {
        dataSource.$accomodations
            .sink { _ in self.tableView.reloadData() }
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
}

