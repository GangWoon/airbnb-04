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
        }
    }
    
    // MARK: - Properties
    private var dataSource: AccommodationsDataSource = .init()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
