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
            let month = month else { return UICollectionViewCell() }
        
        if DateCalculator.firstWeekday(of: month) < indexPath.item + 2,
            (indexPath.item + 2) - DateCalculator.firstWeekday(of: month) <= DateCalculator.end(of: month) {
            cell.dayLabel.text = String((indexPath.item + 2) - DateCalculator.firstWeekday(of: month))
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
