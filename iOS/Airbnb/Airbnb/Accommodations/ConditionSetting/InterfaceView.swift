//
//  InterfaceView.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class InterfaceView: UIView {
    
    // MARK: - Properties
    var dismissButton: UIButton!
    private var titleLabel: UILabel!
    private var resetButton: UIButton!
    private var doneButton: UIButton!
    
    // MARk: - Lifecycle
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
    private func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 12
        configureDismissButton()
        configureTitleLabel()
        configureResetButton()
        configureDoneButton()
    }
    
    private func configureDismissButton() {
        dismissButton = UIButton()
        dismissButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        dismissButton.tintColor = .black
        addSubview(dismissButton)
    }
    
    private func configureTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Title"
        addSubview(titleLabel)
    }
    
    private func configureResetButton() {
        resetButton = UIButton()
        resetButton.setTitle("reset", for: .normal)
        resetButton.setTitleColor(.systemGray, for: .normal)
        resetButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        addSubview(resetButton)
    }
    
    private func configureDoneButton() {
        doneButton = UIButton()
        doneButton.setTitle("done", for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        doneButton.backgroundColor = .black
        doneButton.layer.cornerRadius = 8
        addSubview(doneButton)
    }
    
    // MARK: Constraints
    private func makeConstraints() {
        makeConstraintsDismissButton()
        makeConstraintsTitleLabel()
        makeConstraintsResetButton()
        makeConstraintsDoneButton()
    }
    
    private func makeConstraintsDismissButton() {
        dismissButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(12)
        }
    }
    
    private func makeConstraintsTitleLabel() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(dismissButton)
        }
    }
    
    private func makeConstraintsResetButton() {
        resetButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(12)
            make.width.equalTo(48)
        }
    }
    
    private func makeConstraintsDoneButton() {
        doneButton.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(8)
            make.width.equalTo(48)
        }
    }
    
    func addConditionView(_ view: UIView) {
        addSubview(view)
        view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.bottom.equalTo(doneButton.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }
}
