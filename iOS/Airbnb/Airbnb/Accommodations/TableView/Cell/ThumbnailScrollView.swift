//
//  AccommodationsThumbnailScrollView.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/25.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class ThumbnailScrollView: UIScrollView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var contentView: UIStackView!
    
    // MARK: - Methods
    func addThumbnail(image: UIImage) {
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        contentView.addArrangedSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor).isActive = true
    }
    
    func resetThumbnails() {
        contentView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
            contentView.removeArrangedSubview($0)
        }
    }
}
