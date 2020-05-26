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
    @IBOutlet weak var scrollView: AccommodationsThumbnailScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            configurePageControl()
        }
    }
    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var accommodationsInfoView: AccommodationsInfoView!
    
    // MARK: - Properties
    static let identifier: String = "AccommodationsCell"
    
    // MARK: - IBActions
    @IBAction func moveToPage(_ sender: UIPageControl) {
        let page = CGFloat(sender.currentPage)
        let visibleViewRect = CGRect(x: page * scrollView.frame.width,
                                     y: scrollView.frame.minY,
                                     width: scrollView.frame.width,
                                     height: scrollView.frame.height)
        scrollView
            .scrollRectToVisible(visibleViewRect,
                                 animated: true)
    }
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    // MARK: - Methods
    private func configurePageControl() {
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
    }
    
    func apply(accommodations: Accommodations) {
        let roomType = accommodations.roomType + " ・ " + accommodations.bedroomCount
        let rate = "✭ \(accommodations.rate) (\(accommodations.reviewCount))"
        let attributedString = NSMutableAttributedString(string: rate)
        attributedString
            .addAttribute(.foregroundColor,
                          value: UIColor.systemRed,
                          range: (rate as NSString).range(of: "✭"))
        
        accommodationsInfoView.apply(badge: accommodations.badge,
                                     roomType: roomType,
                                     rate: attributedString,
                                     title: accommodations.name)
        accommodations.images.forEach {
            scrollView.addThumbnail(image: UIImage(named: $0) ?? UIImage())
        }
        favoritesButton.isSelected = accommodations.favorite
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
