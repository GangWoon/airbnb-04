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
        personnelSelectorView = PersonnelSelectorView()
        interfaceView.addConditionView(personnelSelectorView)
        interfaceView.titleLabel.text = "인원"
        bindViewToModel()
        bindModelToView()
    }
    
    private func bindViewToModel() {
        NotificationCenter.default.publisher(for: .buttonTapped)
            .sink { notification in
                guard let isPlus = notification.userInfo?[DetailSelectionView.isPlus] as? Bool,
                    let sender = notification.object as? DetailSelectionView else { return }
                
                if sender === self.personnelSelectorView.adultSelectionView {
                    self.personnelSelector.updateAdult(isPlus: isPlus)
                } else if sender === self.personnelSelectorView.youthSelectionView {
                    self.personnelSelector.updateYouth(isPlus: isPlus)
                } else {
                    self.personnelSelector.updateInfant(isPlus: isPlus)
                }
        }
        .store(in: &subscriptions)
    }
    
    private func bindModelToView() {
        Publishers.CombineLatest3(personnelSelector.$adult,
                                  personnelSelector.$youth,
                                  personnelSelector.$infant)
            .sink { adult, youth, infant in
                self.personnelSelectorView.updateAdultLabel(number: String(adult))
                self.personnelSelectorView.adultSelectionView.minusButton.isEnabled = adult > 0
                self.personnelSelectorView.updateYouthLabel(number: String(youth))
                self.personnelSelectorView.youthSelectionView.minusButton.isEnabled = youth > 0
                self.personnelSelectorView.updateInfantLabel(number: String(infant))
                self.personnelSelectorView.infantSelectionView.minusButton.isEnabled = infant > 0
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
}
