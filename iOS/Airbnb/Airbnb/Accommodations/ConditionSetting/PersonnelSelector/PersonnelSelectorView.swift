//
//  PersonnelSelectorView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class PersonnelSelectorView: UIView {

    // MARK: - Properties
    private var selectionStackView: UIStackView!
    private var adultSelectionView: DetailSelectionView!
    private var youthSelectionView: DetailSelectionView!
    private var infantSelectionView: DetailSelectionView!
    
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
    // MARK: Configure
    func configure() {
        configureSelectionStackView()
        configureAdultSelectionView()
        configureYouthSelectionView()
        configureInfantSelectionView()
    }
    
    func configureSelectionStackView() {
        selectionStackView = UIStackView()
        selectionStackView.axis = .vertical
        selectionStackView.distribution = .fillEqually
        addSubview(selectionStackView)
    }
    
    func configureAdultSelectionView() {
        adultSelectionView = DetailSelectionView(age: .adult)
        selectionStackView.addArrangedSubview(adultSelectionView)
        
    }
    
    func configureYouthSelectionView() {
        youthSelectionView = DetailSelectionView(age: .youth)
        selectionStackView.addArrangedSubview(youthSelectionView)
    }
    
    func configureInfantSelectionView() {
        infantSelectionView = DetailSelectionView(age: .infant)
        selectionStackView.addArrangedSubview(infantSelectionView)
    }
    
    
    // MARK: Constraints
    func makeConstraints() {
        selectionStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
