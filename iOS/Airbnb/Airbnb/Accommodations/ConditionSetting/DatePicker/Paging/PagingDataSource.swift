//
//  PagingDataSource.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class PagingDataSource: NSObject, UICollectionViewDataSource {
    
    private let numberOfMonths: Int = 6
    // 현재 월
    
    // MARK: - Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfMonths
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: PagingCell.identifier,
                                 for: indexPath) as? PagingCell else { return UICollectionViewCell() }
        // 현재 월 + 인덱스를 하면
        return cell
    }
}


