//
//  AccommodationsInfoView.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/25.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class AccommodationsInfoView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var badge: UILabel!
    @IBOutlet weak var roomType: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var title: UILabel!
    
    // MARK: - Methods
    func apply(badge: String, roomType: String, rate: NSMutableAttributedString, title: String) {
        self.badge.text = badge
        self.roomType.text = roomType
        self.rate.attributedText = rate
        self.title.text = title
    }
}
