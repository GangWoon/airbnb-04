//
//  BorderButton.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/20.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

@IBDesignable
final class BorderButton: UIButton {

    @IBInspectable var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    @IBInspectable var borderColor: UIColor {
        get { UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor) }
        set { layer.borderColor = newValue.cgColor }
    }
    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
