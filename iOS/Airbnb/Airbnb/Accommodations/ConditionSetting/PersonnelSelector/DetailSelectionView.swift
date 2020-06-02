//
//  DetailSelectionView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import Combine

class DetailSelectionView: UIView {
    
    // MARK: - Properties
    private var categoryLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var plusButton: BorderButton!
    private var minusButton: BorderButton!
    private var numberLabel: UILabel!
    
    // MARK: - Lifecycle
    init(age: AgeGroup) {
        super.init(frame: .zero)
        configure()
        apply(age)
        makeConstraints()
    }
    
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
    func apply(_ age: AgeGroup) {
        categoryLabel.text = age.category
        descriptionLabel.text = age.description
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: .buttonTapped,
                                        object: self,
                                        userInfo: ["isPlus": sender === plusButton])
    }
    
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
        categoryLabel.font = .boldSystemFont(ofSize: 16)
        addSubview(categoryLabel)
    }
    
    func configureDescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: 11)
        descriptionLabel.textColor = .systemGray
        addSubview(descriptionLabel)
    }
    
    func configureButton(image: UIImage?) -> BorderButton {
        let button = BorderButton()
        button.cornerRadius = 16
        button.borderWidth = 2
        button.borderColor = .systemGray
        button.tintColor = .systemGray
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        return button
    }
    
    func configurePlusButton() {
        plusButton = configureButton(image: UIImage(systemName: "plus"))
        addSubview(plusButton)
    }
    
    func configureNumberLabel() {
        numberLabel = UILabel()
        numberLabel.text = "0"
        numberLabel.font = .systemFont(ofSize: 14)
        addSubview(numberLabel)
    }
    
    func configureMinusButton() {
        minusButton = configureButton(image: UIImage(systemName: "minus"))
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
