//
//  AddMealTextView.swift
//  Out With Friends
//
//  Created by Daniel Slapelis on 3/13/17.
//  Copyright © 2017 Dream Development. All rights reserved.
//

import UIKit

@IBDesignable
class AddMealTextView: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderColor = UIColor(white: 255/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

}
