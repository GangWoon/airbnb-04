//
//  WeekDayView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class WeekDayView: UIStackView {
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Methods
    func configure() {
        distribution = .fillEqually
        WeekDays.allCases.forEach { addArrangedSubview(configureWeekDayLabel($0)) }
    }
    
    func configureWeekDayLabel(_ weekDay: WeekDays) -> UILabel {
        let label = UILabel()
        label.text = weekDay.description
        label.textColor = weekDay.color()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 12)
        
        return label
    }
}

