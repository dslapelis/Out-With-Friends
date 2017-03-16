//
//  MealObject.swift
//  Out With Friends
//
//  Created by Daniel Slapelis on 3/14/17.
//  Copyright © 2017 Dream Development. All rights reserved.
//

import UIKit

class MealObject: NSObject {
    
    private var _friendName = ""
    private var _mealCost = 0.00
    private var _tipCost = 0.00
    private var _taxCost = 0.00
    private var _tipPercentage = 0.00
    private var _taxPercentage = 0.00
    
    
    var friendName: String {
        get {
            return _friendName
        }
        set (newFriendName) {
            _friendName = newFriendName
        }
    }
    
    var mealCost: Double {
        get {
            return _mealCost
        }
        set (newMealCost) {
            _mealCost = newMealCost
        }
    }
    var tipCost: Double {
        get {
            return _tipCost
        }
        set (newTipCost) {
            _tipCost = newTipCost
        }
    }
    var taxCost: Double {
        get {
            return _taxCost
        }
        set (newTaxCost) {
            _taxCost = newTaxCost
        }
    }
    var tipPercentage: Double {
        get {
            return _tipPercentage
        }
        set (newTipPercentage) {
            _tipPercentage = newTipPercentage
        }
    }
    var taxPercentage: Double {
        get {
            return _taxPercentage
        }
        set (newTaxPercentage) {
            _taxPercentage = newTaxPercentage
        }
    }
}
