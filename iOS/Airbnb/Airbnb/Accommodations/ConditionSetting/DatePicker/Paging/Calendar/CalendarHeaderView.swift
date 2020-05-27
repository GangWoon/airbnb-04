//
//  CalendarHeaderView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class CalendarHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    static let identifier: String = "CalendarHeaderView"
    private var monthLabel: UILabel!
    
    // MARK: - Lifecycle
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
        monthLabel = UILabel()
        monthLabel.text = "Month"
        monthLabel.font = .boldSystemFont(ofSize: 14)
        addSubview(monthLabel)
        monthLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }
    }
}
