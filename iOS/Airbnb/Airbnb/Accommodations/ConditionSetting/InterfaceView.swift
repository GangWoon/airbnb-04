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
    private var dismissButton: UIButton!
    private var titleLabel: UILabel!
    private var resetButton: UIButton!
    private var doneButton: UIButton!
    
    // MARk: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Methods
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
        dismissButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(12)
        }
    }
    
    private func configureTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Title"
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(dismissButton)
        }
    }
    
    private func configureResetButton() {
        resetButton = UIButton()
        resetButton.setTitle("reset", for: .normal)
        resetButton.setTitleColor(.systemGray, for: .normal)
        resetButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        addSubview(resetButton)
        resetButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(12)
            make.width.equalTo(48)
        }
    }
    
    private func configureDoneButton() {
        doneButton = UIButton()
        doneButton.setTitle("done", for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        doneButton.backgroundColor = .black
        doneButton.layer.cornerRadius = 8
        addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(8)
            make.width.equalTo(48)
        }
    }
}
