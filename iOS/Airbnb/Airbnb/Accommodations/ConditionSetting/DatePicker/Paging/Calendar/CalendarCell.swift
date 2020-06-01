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
    var dayButton: UIButton!
    
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
        dayButton.setTitle("", for: .normal)
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        dayButton = UIButton()
        dayButton.setTitleColor(.black, for: .normal)
        dayButton.titleLabel?.textAlignment = .center
        dayButton.titleLabel?.font = .boldSystemFont(ofSize: 11)
        addSubview(dayButton)
    }

    // MARK: Constraints
    private func makeConstraints() {
        dayButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
