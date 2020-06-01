//
//  CalendarDataSource.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class CalendarDataSource: NSObject, UICollectionViewDataSource {
    
    private let numberOfDays: Int = 42
    private let index: Int
    private var month: Date? {
        DateCalculator.monthLater(value: index)
    }
    
    init(index: Int) {
        self.index = index
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfDays
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: CalendarCell.identifier,
                                 for: indexPath) as? CalendarCell,
            let month = month,
            let firstDay = DateCalculator.firstDay(of: month) else { return UICollectionViewCell() }
        cell.dayButton.isEnabled = false
        
        if DateCalculator.weekday(of: firstDay) < indexPath.item + 2,
            (indexPath.item + 2) - DateCalculator.weekday(of: firstDay) <= DateCalculator.end(of: month) {
            let index = (indexPath.item + 1) - DateCalculator.weekday(of: firstDay)
            let date = DateCalculator.date(byAdding: .day, value: index, to: firstDay)
            let weekDay = WeekDays(rawValue: DateCalculator.weekday(of: date))
            cell.dayButton.setTitleColor(weekDay?.color(), for: .normal)
            cell.dayButton
                .setTitle(DateCalculator.day(of: date), for: .normal)
            cell.apply(date: date)
            guard DateCalculator.today() <= date else {
                cell.dayButton.setTitleColor(.systemGray, for: .normal)
                
                return cell
            }
            cell.dayButton.isEnabled = true
            
            if date == DatePicker.shared.startDate || date == DatePicker.shared.endDate {
                cell.toggle(state: true)
            }

            guard let startDate = DatePicker.shared.startDate,
                let endDate = DatePicker.shared.endDate else { return cell }
            let bgColor = UIColor.lightGray.withAlphaComponent(0.1)
            if startDate...endDate ~= date {
                cell.leftBackgroundView.backgroundColor = bgColor
                cell.rightBackgroundView.backgroundColor = bgColor
            }
            
            if DatePicker.shared.startDate != nil && DatePicker.shared.endDate != nil {
                if date == DatePicker.shared.startDate {
                     
                    cell.rightBackgroundView.backgroundColor = bgColor
                    cell.leftBackgroundView.backgroundColor = .clear
                    
                }
                if date == DatePicker.shared.endDate {
                    cell.rightBackgroundView.backgroundColor = .clear
                    cell.leftBackgroundView.backgroundColor = bgColor
                    
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView
            .dequeueReusableSupplementaryView(ofKind: kind,
                                              withReuseIdentifier: CalendarHeaderView.identifier,
                                              for: indexPath) as? CalendarHeaderView,
            let month = month else { return UICollectionReusableView() }
        headerView
            .applyDate(month: DateCalculator.month(from: month),
                       year: DateCalculator.year(from: month))
        
        return headerView
    }
}
