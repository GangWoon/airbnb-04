//
//  CalendarView.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class CalendarView: UICollectionView {
    
    var calendarCellSize: CGSize {
        CGSize(width: frame.width / 7,
               height: frame.height / 7)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame,
                   collectionViewLayout: layout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        isScrollEnabled = false
    }
}
