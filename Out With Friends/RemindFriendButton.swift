//
//  RemindFriendButton.swift
//  Out With Friends
//
//  Created by Daniel Slapelis on 3/13/17.
//  Copyright © 2017 Dream Development. All rights reserved.
//

import UIKit

@IBDesignable
class RemindFriendButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderColor = UIColor(white: 255/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
        
    }

}
