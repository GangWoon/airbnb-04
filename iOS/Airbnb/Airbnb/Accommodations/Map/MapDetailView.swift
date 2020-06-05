//
//  MapDetailView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/05.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class MapDetailView: UIView {
    
    // MARK: - Properties
    private var imageView: UIImageView!
    private var title: UILabel!
    private var badge: BorderLabel!
    private var roomType: UILabel!
    private var rate: UILabel!
    
    // MARK: - Lifecycle
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
    
    // MARK: - Methods
    func apply(with viewModel: AccommodationsCellViewModel) {
        self.badge.text = viewModel.badge
        self.roomType.text = viewModel.roomType
        self.rate.attributedText = viewModel.rate
        self.title.text = viewModel.title
        self.imageView.image = viewModel.images[0]
    }
    
    // MARK: Configure
    private func configure() {
        configureImageView()
        configureBadgeLabel()
        configureRoomTypeLabel()
        configureRateLabel()
        configureTitleLabel()
    }
    
    private func configureImageView() {
        imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        addSubview(imageView)
    }
    
    private func configureBadgeLabel() {
        badge = BorderLabel()
        badge.borderWidth = 1
        badge.cornerRadius = 5
        badge.paddingWidth = 10
        badge.paddingHeight = 2
        badge.font = .boldSystemFont(ofSize: 11)
        badge.textAlignment = .center
        addSubview(badge)
    }
    
    private func configureRoomTypeLabel() {
        roomType = UILabel()
        roomType.font = .systemFont(ofSize: 10)
        roomType.textColor = .systemGray
        addSubview(roomType)
    }
    
    private func configureRateLabel() {
        rate = UILabel()
        rate.font = .systemFont(ofSize: 12)
        addSubview(rate)
    }
    
    private func configureTitleLabel() {
        title = UILabel()
        title.font = .systemFont(ofSize: 16)
        title.numberOfLines = 0
        addSubview(title)
    }
    
    // MARK: Constraints
    private func makeConstraints() {
        makeConstraintsImageView()
        makeConstraintsBadgeLabel()
        makeConstraintsRoomTypeLabel()
        makeConstraintsRateLabel()
        makeConstraintsTitleLabel()
    }
    
    private func makeConstraintsImageView() {
        imageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
    }
    
    private func makeConstraintsBadgeLabel() {
        badge.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-8)
            make.leading.equalToSuperview()
        }
    }
    
    private func makeConstraintsRoomTypeLabel() {
        roomType.snp.makeConstraints { make in
            make.centerY.equalTo(badge)
            make.leading.equalTo(badge.snp.trailing).inset(-8)
        }
    }
    
    private func makeConstraintsRateLabel() {
        rate.snp.makeConstraints { make in
            make.centerY.equalTo(badge)
            make.trailing.equalToSuperview()
        }
    }
    
    private func makeConstraintsTitleLabel() {
        title.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(badge.snp.bottom)
        }
    }
}

