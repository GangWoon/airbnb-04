//
//  BoderLabel.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/21.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

@IBDesignable
final class BorderLabel: UILabel {
    
    // MARK: - IBInspectables
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
    // MARK: Padding
    @IBInspectable var paddingWidth: CGFloat {
        get { padding.width }
        set { padding.width = newValue }
    }
    @IBInspectable var paddingHeight: CGFloat {
        get { padding.height }
        set { padding.height = newValue }
    }
    
    // MARK: - Properties
    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.width
        let heigth = superContentSize.height + padding.height
        return CGSize(width: width, height: heigth)
    }
    private var padding: CGSize = .init(width: 0, height: 0)
}
