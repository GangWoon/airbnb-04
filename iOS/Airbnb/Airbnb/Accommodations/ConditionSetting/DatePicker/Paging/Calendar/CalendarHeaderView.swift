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
    private var yearLabel: UILabel!
    
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
    func applyDate(month: String?, year: String?) {
        monthLabel.text = month
        yearLabel.text = year
    }
    
    // MARK: Configure
    private func configure() {
        backgroundColor = .systemBackground
        configureMonthLabel()
        configureYearLabel()
    }
    
    private func configureMonthLabel() {
        monthLabel = UILabel()
        monthLabel.text = "Month"
        monthLabel.font = .boldSystemFont(ofSize: 14)
        addSubview(monthLabel)
    }
    
    private func configureYearLabel() {
        yearLabel = UILabel()
        yearLabel.text = "Year"
        yearLabel.font = .boldSystemFont(ofSize: 14)
        addSubview(yearLabel)
    }
    
    // MARK: Constraints
    private func makeConstraints() {
        makeConstraintsMonthLabel()
        makeConstraintsYearLabel()
    }
    
    private func makeConstraintsMonthLabel() {
        monthLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }
    }
    
    private func makeConstraintsYearLabel() {
        yearLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(monthLabel.snp.trailing).offset(8)
        }
    }
}
