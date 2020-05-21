//
//  SearchTextField.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/20.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

@IBDesignable
final class SearchTextField: UITextField {
    
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
    // MARK: Shadow
    @IBInspectable var shadowOpacity: Float {
        get { layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    @IBInspectable var shadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    // MARK: - Properties
    private var edgeInsets: UIEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 10)
    
    // MARK: - Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: edgeInsets)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: edgeInsets)
    }
}
