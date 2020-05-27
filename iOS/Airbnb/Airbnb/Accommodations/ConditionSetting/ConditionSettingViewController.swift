//
//  ConditionSettingViewController.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ConditionSettingViewController: UIViewController {
    
    // MARK: - Properties
    private var dimmedView: UIView!
    var interfaceView: InterfaceView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .clear
        configureDimmedView()
        configureInterfaceView()
    }
    
    private func configureDimmedView() {
        dimmedView = UIView()
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.66)
        view.addSubview(dimmedView)
        dimmedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureInterfaceView() {
        interfaceView = InterfaceView()
        view.addSubview(interfaceView)
        interfaceView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(400)
        }
    }
}
