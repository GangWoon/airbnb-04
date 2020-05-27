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
}
