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
    
    // MARK: - Lifecycle
    init(index: Int, datePicker: DatePicker) {
        self.datePicker = datePicker
        datePicker.updateMonth(with: index)
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
        guard datePicker.isIncludeInMonth(date: indexDays) else { return cell }
        let day = datePicker.convertDate(from: indexDays)
        cell.apply(date: day)
        guard datePicker.isPastDay(date: day) else {
            cell.dayButton
                .setTitleColor(.systemGray,
                               for: .normal)
            
            return cell
        }
        cell.dayButton.isEnabled = true
        if datePicker.isSelectedDate(date: day) {
            cell.toggle(state: true)
        }
        guard let startDate = datePicker.startDate,
            let endDate = datePicker.endDate,
            startDate != endDate else { return cell }
        cell.applyBackgroundColor(isStart: day == startDate || datePicker.isInRange(date: day),
                                  isEnd: day == endDate || datePicker.isInRange(date: day))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView
            .dequeueReusableSupplementaryView(ofKind: kind,
                                              withReuseIdentifier: CalendarHeaderView.identifier,
                                              for: indexPath) as? CalendarHeaderView else { return UICollectionReusableView() }
        headerView.applyDate(month: datePicker.monthString,
                       year: datePicker.yearString)
        
        return headerView
    }
}
