//
//  CalendarDataSource.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class CalendarDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Properties
    private let datePicker: DatePicker
    private let numberOfDays: Int = 42
    private let index: Int
    private var month: Date? {
        DateCalculator.monthLater(value: index)
    }
    
    // MARK: - Lifecycle
    init(index: Int, datePicker: DatePicker) {
        self.index = index
        self.datePicker = datePicker
    }
    
    // MARK: - Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfDays
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let indexDays = indexPath.item + 1
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: CalendarCell.identifier,
                                 for: indexPath) as? CalendarCell else { return UICollectionViewCell() }
        guard let month = month,
            let firstDay = DateCalculator.firstDay(of: month) else { return cell }
        guard DateCalculator.weekday(of: firstDay) <= indexDays,
            indexDays - DateCalculator.weekday(of: firstDay) < DateCalculator.end(of: month) else { return cell }
        let index = indexDays - DateCalculator.weekday(of: firstDay)
        let day = DateCalculator.date(byAdding: .day, value: index, to: firstDay)
        cell.apply(date: day)
        guard DateCalculator.today() <= day else {
            cell.dayButton
                .setTitleColor(.systemGray,
                               for: .normal)
            
            return cell
        }
        cell.dayButton.isEnabled = true
        if day == datePicker.startDate || day == datePicker.endDate {
            cell.toggle(state: true)
        }
        guard let startDate = datePicker.startDate,
            let endDate = datePicker.endDate,
            startDate != endDate else { return cell }
        let isInRange = DateCalculator.nextDay(of: startDate)..<endDate ~= day
        cell.applyBackgroundColor(isStart: day == startDate || isInRange,
                                  isEnd: day == endDate || isInRange)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView
            .dequeueReusableSupplementaryView(ofKind: kind,
                                              withReuseIdentifier: CalendarHeaderView.identifier,
                                              for: indexPath) as? CalendarHeaderView,
            let month = month else { return UICollectionReusableView() }
        headerView.applyDate(month: DateCalculator.month(from: month),
                       year: DateCalculator.year(from: month))
        
        return headerView
    }
}
