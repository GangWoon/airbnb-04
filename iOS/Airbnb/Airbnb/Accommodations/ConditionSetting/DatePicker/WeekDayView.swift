//
//  WeekDayView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class WeekDayView: UIStackView {
    
    // MARK: - Properties
    private let weekDays = ["Sun", "Mon" , "Tue", "Wed", "Thu", "Fri", "Sat"]
    
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
        weekDays.forEach { addArrangedSubview(configureWeekDayLabel($0)) }
    }
    
    func configureWeekDayLabel(_ weekDay: String) -> UILabel {
        let label = UILabel()
        label.text = weekDay
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 12)
        
        return label
    }
}

