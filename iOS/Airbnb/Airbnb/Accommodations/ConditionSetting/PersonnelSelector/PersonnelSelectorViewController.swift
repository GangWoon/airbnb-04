//
//  PersonnelSelectorViewController.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import Combine

final class PersonnelSelectorViewController: ConditionSettingViewController {
    
    // MARK: - Properties
    private var personnelSelectorView: PersonnelSelectorView!
    private var personnelSelector: PersonnelSelector = .init()
    private var subscriptions: Set<AnyCancellable> = .init()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Methods
    // MARK: Configure
    private func configure() {
        configureInterfaceView()
        bindViewToModel()
        bindModelToView()
    }
    
    private func configureInterfaceView() {
        personnelSelectorView = PersonnelSelectorView()
        interfaceView.addConditionView(personnelSelectorView)
        interfaceView.titleLabel.text = "인원"
        interfaceView.resetButton.addTarget(self,
                                            action: #selector(resetButtonTapped(_:)),
                                            for: .touchUpInside)
    }
    
    private func bindViewToModel() {
        NotificationCenter.default.publisher(for: .buttonTapped)
            .sink { notification in
                guard let isPlus = notification.userInfo?[DetailSelectionView.isPlus] as? Bool,
                    let category = notification.object as? AgeGroup else { return }
                self.personnelSelector.update(category: category, isPlus: isPlus)
        }
        .store(in: &subscriptions)
    }
    
    private func bindModelToView() {
        Publishers.CombineLatest3(personnelSelector.$adult,
                                  personnelSelector.$youth,
                                  personnelSelector.$infant)
            .sink { adult, youth, infant in
                self.personnelSelectorView.updateLabels(String(adult),
                                                        String(youth),
                                                        String(infant))
                self.personnelSelectorView.updateButtonState(adult > 0,
                                                             youth > 0,
                                                             infant > 0)
        }
        .store(in: &subscriptions)
    }
    
    // MARK: Constraints
    override func makeConstraintsInterfaceView() {
        super.makeConstraintsInterfaceView()
        interfaceView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
    }
    
    //MARK: Objc
    @objc private func resetButtonTapped(_ sender: UIButton) {
        personnelSelector.reset()
    }
}
