//
//  CustomTextField.swift
//  XCUITestTemplate
//
//  Created by Santhosh Nampally on 24/05/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit
@IBDesignable
final class CustomTextField: UITextField {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet (newValue){
            self.layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    var borderWidth: CGFloat = 0.0 {
        didSet(newValue){
            self.layer.borderWidth = newValue
        }
    }
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet(newValue) {
            self.layer.borderColor = newValue.cgColor
        }
    }
}
