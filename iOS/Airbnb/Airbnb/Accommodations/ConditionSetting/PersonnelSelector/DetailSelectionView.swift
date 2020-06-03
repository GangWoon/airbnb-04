//
//  DetailSelectionView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import Combine

final class DetailSelectionView: UIView {
    
    // MARK: - Properties
    static let isPlus: String = "isPlus"
    private var categoryLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var plusButton: BorderButton!
    var minusButton: BorderButton!
    var numberLabel: UILabel!
    
    // MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        configure()
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
    func apply(_ category: Informationable) {
        categoryLabel.text = category.category
        descriptionLabel.text = category.description
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: .buttonTapped,
                                        object: self,
                                        userInfo: [DetailSelectionView.isPlus: sender === plusButton])
    }
    
    // MARK: Configure
    private func configure() {
        configureCategoryLabel()
        configureDescriptionLabel()
        configurePlusButton()
        configureNumberLabel()
        configureMinusButton()
    }
    
    private func configureCategoryLabel() {
        categoryLabel = UILabel()
        categoryLabel.font = .boldSystemFont(ofSize: 16)
        addSubview(categoryLabel)
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: 11)
        descriptionLabel.textColor = .systemGray
        addSubview(descriptionLabel)
    }
    
    private func configureButton(image: UIImage?) -> BorderButton {
        let button = BorderButton()
        button.cornerRadius = 16
        button.borderWidth = 2
        button.borderColor = .systemGray
        button.tintColor = .systemGray
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        return button
    }
    
    private func configurePlusButton() {
        plusButton = configureButton(image: UIImage(systemName: "plus"))
        addSubview(plusButton)
    }
    
    private func configureNumberLabel() {
        numberLabel = UILabel()
        numberLabel.text = "0"
        numberLabel.font = .systemFont(ofSize: 14)
        numberLabel.textAlignment = .center
        addSubview(numberLabel)
    }
    
    private func configureMinusButton() {
        minusButton = configureButton(image: UIImage(systemName: "minus"))
        addSubview(minusButton)
    }
    
    // MARK: Constraints
    private func makeConstraints() {
        makeConstraintsCategoryLabel()
        makeConstraintsDescriptionsLabel()
        makeConstraintsPlusButton()
        makeConstraintsNumberLabel()
        makeConstraintsMinusButton()
    }
    
    private func makeConstraintsCategoryLabel() {
        categoryLabel.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
        }
    }
    
    private func makeConstraintsDescriptionsLabel() {
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(categoryLabel.snp.bottom)
        }
    }
    
    private func makeConstraintsPlusButton() {
        plusButton.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(plusButton.snp.width)
        }
    }
    
    private func makeConstraintsNumberLabel() {
        numberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(plusButton.snp.leading).inset(-8)
            make.width.height.equalTo(20)
        }
    }
    
    private func makeConstraintsMinusButton() {
        minusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(minusButton.snp.width)
            make.trailing.equalTo(numberLabel.snp.leading).inset(-8)
        }
    }
}
