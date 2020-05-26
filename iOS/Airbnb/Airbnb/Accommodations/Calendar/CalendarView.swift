//
//  CalendarView.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/26.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
class DatePikcerView: UIView {
    
    // MARK: - IBOutlets
    private var weekDayView: WeekDayView!
    private var pagingView: PagingView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        configureWeekDayView()
    }
    
    private func configureWeekDayView() {
        weekDayView = WeekDayView()
        addSubview(weekDayView)
        weekDayView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
    }
}

class WeekDayView: UIStackView {
    
    private let weekDays = ["Sun", "Mon" , "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
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

class PagingView: UICollectionView {
    
}

class CalendarView: UICollectionView {
    
}

