//
//  DetailSelectionView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class DetailSelectionView: UIView {

    // MARK: - Properties
    private var categoryLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var plusButton: BorderButton!
    private var minusButton: BorderButton!
    private var numberLabel: UILabel!
    
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
        configureCategoryLabel()
        configureDescriptionLabel()
        configurePlusButton()
        configureNumberLabel()
        configureMinusButton()
    }
    
    func configureCategoryLabel() {
        categoryLabel = UILabel()
        categoryLabel.text = "분류"
        categoryLabel.font = .boldSystemFont(ofSize: 16)
        addSubview(categoryLabel)
    }

    func configureDescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.text = "설명"
        descriptionLabel.font = .systemFont(ofSize: 11)
        addSubview(descriptionLabel)
    }
    
    func configurePlusButton() {
        plusButton = BorderButton()
        plusButton.cornerRadius = 20
        plusButton.borderWidth = 2
        plusButton.borderColor = .systemGray
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addSubview(plusButton)
    }
    
    func configureNumberLabel() {
        numberLabel = UILabel()
        numberLabel.text = "0"
        numberLabel.font = .systemFont(ofSize: 14)
        addSubview(numberLabel)
    }
    
    func configureMinusButton() {
        minusButton = BorderButton()
        minusButton.cornerRadius = 16
        minusButton.borderWidth = 2
        minusButton.borderColor = .systemGray
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        addSubview(minusButton)
    }
    
    // MARK: Constraints
    func makeConstraints() {
        makeConstraintsCategoryLabel()
        makeConstraintsDescriptionsLabel()
        makeConstraintsPlusButton()
        makeConstraintsNumberLabel()
        makeConstraintsMinusButton()
    }
    
    func makeConstraintsCategoryLabel() {
        categoryLabel.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
        }
    }
    
    func makeConstraintsDescriptionsLabel() {
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(categoryLabel.snp.bottom)
        }
    }
    
    func makeConstraintsPlusButton() {
        plusButton.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(plusButton.snp.width)
        }
    }
    
    func makeConstraintsNumberLabel() {
        numberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(plusButton.snp.leading).inset(-8)
        }
    }
    
    func makeConstraintsMinusButton() {
        minusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(minusButton.snp.width)
            make.trailing.equalTo(numberLabel.snp.leading).inset(-8)
        }
    }
}
