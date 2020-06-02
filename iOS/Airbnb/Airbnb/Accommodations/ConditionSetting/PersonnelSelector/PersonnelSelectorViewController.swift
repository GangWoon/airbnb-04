//
//  PersonnelSelectorViewController.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class PersonnelSelectorViewController: ConditionSettingViewController {

    // MARK: - Properties
    private var personnelSelectorView: PersonnelSelectorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Methods
    // MARK: Configure
    func configure() {
        personnelSelectorView = PersonnelSelectorView()
        interfaceView.addConditionView(personnelSelectorView)
        interfaceView.titleLabel.text = "인원"
    }
    
    // MARK: Constraints
    override func makeConstraintsInterfaceView() {
        super.makeConstraintsInterfaceView()
        interfaceView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
    }
}
