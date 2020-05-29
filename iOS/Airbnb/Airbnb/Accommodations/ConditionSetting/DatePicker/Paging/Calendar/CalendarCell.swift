//
//  CalendarCell.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class CalendarCell: UICollectionViewCell {
    
    static let identifier: String = "CalendarCell"
    var dayLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        makeConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dayLabel.text = ""
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        dayLabel = UILabel()
        dayLabel.textAlignment = .center
        dayLabel.font = .boldSystemFont(ofSize: 11)
        addSubview(dayLabel)
    }

    // MARK: Constraints
    private func makeConstraints() {
        dayLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
