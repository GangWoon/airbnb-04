//
//  ConditionSettingViewController.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import SnapKit

final class ConditionSettingViewController: UIViewController {
    
    // MARK: - Properties
    private var dimmedView: UIView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        configureDimmedView()
        view.backgroundColor = .clear
        
    }
    
    private func configureDimmedView() {
        dimmedView = UIView()
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.66)
        view.addSubview(dimmedView)
        dimmedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
