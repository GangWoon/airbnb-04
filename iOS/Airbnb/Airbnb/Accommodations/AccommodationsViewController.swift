//
//  AccommodationsViewController.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/21.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableView
// MARK: Delegate
extension AccommodationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView
            .dequeueReusableHeaderFooterView(withIdentifier: AccommodationsHeaderView.identifier)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? AccommodationsHeaderView else { return }
        headerView
            .configure(text: "날짜와 인원을 선택하시면 가격별 숙소를 추천해드립니다.")
    }
}

