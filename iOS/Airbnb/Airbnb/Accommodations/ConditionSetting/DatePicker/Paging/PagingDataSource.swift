//
//  PagingDataSource.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class PagingDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Properties
    private let datePicker: DatePicker
    private let numberOfMonths: Int = 6
    
    // MARK: - Lifecycle
    init(datePicker: DatePicker) {
        self.datePicker = datePicker
    }
    
    // MARK: - Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfMonths
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: PagingCell.identifier,
                                 for: indexPath) as? PagingCell else { return UICollectionViewCell() }
        cell.apply(dataSource: CalendarDataSource(index: indexPath.item, datePicker: datePicker))
        
        return cell
    }
}

