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
        configureMonthLabel()
    }
    
    private func configureMonthLabel() {
        monthLabel = UILabel()
        monthLabel.text = "Month"
        monthLabel.font = .boldSystemFont(ofSize: 14)
        addSubview(monthLabel)
    }
    
    // MARK: Constraints
    private func makeConstraints() {
        monthLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }
    }
}
