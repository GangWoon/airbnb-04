//
//  AccommodationsThumbnailScrollView.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/25.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class AccommodationsThumbnailScrollView: UIScrollView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Methods
    func addThumbnail(image: UIImage) {
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        stackView.addArrangedSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor).isActive = true
    }
    
    func resetThumbnails() {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
            stackView.removeArrangedSubview($0)
        }
    }
}
