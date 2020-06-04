//
//  AccommodationsCellViewModel.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/26.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class AccommodationsCellViewModel {
    
    // MARK: - Properties
    private var accommodations: Accommodations
    var images: [UIImage] = .init()
    var badge: String {
        accommodations.badge ? "SUPERHOST" : "NEWHOST"
    }
    var roomType: String {
        configureRoomType()
    }
    var rate: NSMutableAttributedString {
        configureRate()
    }
    var title: String {
        accommodations.name
    }
    var isFavorite: Bool {
        accommodations.favorite
    }
    
    // MARK: - Lifecycle
    init(accommodations: Accommodations) {
        self.accommodations = accommodations
    }
    
    // MARK: - Methods
    private func configureRoomType() -> String {
        return accommodations.roomType + " ・ " + String(accommodations.bedRoomCount)
    }
    
    private func configureRate() -> NSMutableAttributedString {
        let rate = "✭ \(accommodations.rate) (\(accommodations.reviewCount))"
        let attributedString = NSMutableAttributedString(string: rate)
        attributedString
            .addAttribute(.foregroundColor,
                          value: UIColor.systemRed,
                          range: (rate as NSString).range(of: "✭"))
        
        return attributedString
    }
}
