//
//  UITextField.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/04.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

extension UITextField {
    var notificationPublisher: NotificationCenter.Publisher {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification,
                       object: self)
    }
}
