//
//  AccommodationsHeaderView.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/21.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class AccommodationsHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    static let identifier: String = "AccommodationsHeaderView"
    static let height: CGFloat = 20
    static let section: Int = 0
    let fontSize: CGFloat = 13
    
    // MARK: - Methods
    func configure(text: String) {
        textLabel?.text = text
        textLabel?.textColor = .systemGray
        textLabel?.textAlignment = .center
        textLabel?.font = .boldSystemFont(ofSize: fontSize)
        tintColor = .clear
    }
}
