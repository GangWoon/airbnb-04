//
//  WeekDayView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class WeekDayView: UIStackView {
    
    enum WeekDays: CustomStringConvertible, CaseIterable {
        
        case Sun, Mon, Tue, Wed, Thu, Fri, Sat

        var description: String {
            switch self {
            case .Sun:
                return "Sun"
            case .Mon:
                return "Mon"
            case .Tue:
                return "Tue"
            case .Wed:
                return "Wed"
            case .Thu:
                return "Thu"
            case .Fri:
                return "Fri"
            case .Sat:
                return "Sat"
            }
        }
        
        func color() -> UIColor {
            switch self {
            case .Sun:
                return .systemRed
            case .Sat:
                return .systemBlue
            default:
                return .systemGray
            }
        }
    }
    
    // MARK: - Properties
    
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

