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
    @IBInspectable var shadowOpacity: Float {
        get { layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    @IBInspectable var shadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
}
