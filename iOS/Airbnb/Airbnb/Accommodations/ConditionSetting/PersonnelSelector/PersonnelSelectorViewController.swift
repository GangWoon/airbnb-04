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
    }
    
    // MARK: Constraints
    override func makeConstriantsInterfaceView() {
        super.makeConstriantsInterfaceView()
        interfaceView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
    }
}
