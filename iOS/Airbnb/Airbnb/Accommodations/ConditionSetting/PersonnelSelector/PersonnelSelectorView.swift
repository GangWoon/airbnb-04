//
//  PersonnelSelectorView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class PersonnelSelectorView: UIView {

    // MARK: - Properties
    private var selectionStackView: UIStackView!
    var adultSelectionView: DetailSelectionView!
    var youthSelectionView: DetailSelectionView!
    var infantSelectionView: DetailSelectionView!
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        makeConstraints()
    }
    
    // MARK: - Methods
    func updateLabels(_ adult: String, _ youth: String, _ infant: String) {
        adultSelectionView.numberLabel.text = adult
        youthSelectionView.numberLabel.text = youth
        infantSelectionView.numberLabel.text = infant
    }
    
    func updateButtonState(_ adult: Bool, _ youth: Bool, _ infant: Bool  ) {
        adultSelectionView.minusButton.isEnabled = adult
        youthSelectionView.minusButton.isEnabled = youth
        infantSelectionView.minusButton.isEnabled = infant
    }
    
    // MARK: Configure
    private func configure() {
        configureSelectionStackView()
        configureAdultSelectionView()
        configureYouthSelectionView()
        configureInfantSelectionView()
    }
    
    private func configureSelectionStackView() {
        selectionStackView = UIStackView()
        selectionStackView.axis = .vertical
        selectionStackView.distribution = .fillEqually
        addSubview(selectionStackView)
    }
    
    private func configureAdultSelectionView() {
        adultSelectionView = DetailSelectionView(age: .adult)
        selectionStackView.addArrangedSubview(adultSelectionView)
        
    }
    
    private func configureYouthSelectionView() {
        youthSelectionView = DetailSelectionView(age: .youth)
        selectionStackView.addArrangedSubview(youthSelectionView)
    }
    
    private func configureInfantSelectionView() {
        infantSelectionView = DetailSelectionView(age: .infant)
        selectionStackView.addArrangedSubview(infantSelectionView)
    }
    
    
    // MARK: Constraints
    private func makeConstraints() {
        selectionStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
