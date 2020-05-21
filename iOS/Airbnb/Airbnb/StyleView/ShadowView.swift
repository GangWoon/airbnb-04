//
//  ShadowView.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/21.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {
    
    // MARK: - IBInspectable
    // MARK: Border
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
    // MARK: Shadow
    @IBInspectable var shadowOpacity: Float {
        get { layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    @IBInspectable var shadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
}
