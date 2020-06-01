//
//  PagingView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import Combine

final class PagingView: UICollectionView {
    
    var subscription: AnyCancellable?
    
    // MARK: - Lifecycle
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Methods
    func configure() {
        backgroundColor = .systemBackground
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        guard let flowlayout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowlayout.scrollDirection = .horizontal
        
        subscription = Publishers.CombineLatest(DatePicker.shared.$startDate, DatePicker.shared.$endDate)
            .sink { _ in self.reloadData() }
    }
}
