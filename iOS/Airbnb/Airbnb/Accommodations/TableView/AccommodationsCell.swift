//
//  AccommodationsCell.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/21.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class AccommodationsCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            configurePageControl()
        }
    }
    
    // MARK: - Properties
    static let identifier: String = "AccommodationsCell"
    
    // MARK: - Methods
    private func configurePageControl() {
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
    }
}

// MARK: - UIScrollView
// MARK: Delegate
extension AccommodationsCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(page)
    }
}
