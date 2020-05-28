//
//  PagingView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class PagingView: UICollectionView {
    
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
    }
}
