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
    @IBInspectable var paddingTop: CGFloat {
        get { padding.top }
        set { padding.top = newValue }
    }
    @IBInspectable var paddingLeft: CGFloat {
        get { padding.left }
        set { padding.left = newValue }
    }
    @IBInspectable var paddingBottom: CGFloat {
        get { padding.bottom }
        set { padding.bottom = newValue }
    }
    @IBInspectable var paddingRight: CGFloat {
        get { padding.right }
        set { padding.right = newValue }
    }
    
    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
    private var padding: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
}
