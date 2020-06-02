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
        configureSelectionViews()
        configureSelectionStackView()
    }
    
    func configureSelectionViews() {
        adultSelectionView = DetailSelectionView()
        youthSelectionView = DetailSelectionView()
        infantSelectionView = DetailSelectionView()
    }
    
    func configureSelectionStackView() {
        selectionStackView = UIStackView()
        selectionStackView.axis = .vertical
        selectionStackView.distribution = .fillEqually
        selectionStackView.addArrangedSubview(adultSelectionView)
        selectionStackView.addArrangedSubview(youthSelectionView)
        selectionStackView.addArrangedSubview(infantSelectionView)
        addSubview(selectionStackView)
    }
    
    // MARK: Constraints
    func makeConstraints() {
        selectionStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}

