//
//  MealViewController.swift
//  Out With Friends
//
//  Created by Daniel Slapelis on 3/13/17.
//  Copyright © 2017 Dream Development. All rights reserved.
//

import UIKit

protocol MealViewControllerDelegate {
    func acceptData(data: MealObject!, vc: MealViewController!)
}
class MealViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var friendNameView: UILabel!
    @IBOutlet weak var friendNameBox: AddMealTextView!
    @IBOutlet weak var dollarTotalView: UILabel!
    @IBOutlet weak var totalTextView: UILabel!
    @IBOutlet weak var mealCostBox: AddMealTextView!
    @IBOutlet weak var tipPercentageBox: AddMealTextView!
    @IBOutlet weak var taxPercentageBox: AddMealTextView!
    @IBOutlet weak var addMealButton: RemindFriendButton!
    
    private var friendName: String = ""
    private var mealCost: Double = 0.00
    private var tipPercentage: Double = 0.00
    private var tipCost: Double = 0.00
    private var taxPercentage: Double = 0.00
    private var taxCost: Double = 0.00
    private var mealObject:MealObject = MealObject()
    
    //var delegate : MealViewControllerDelegate?
    var data : MealObject?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MealViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func friendNameChanged(_ sender: Any) {
        friendName = friendNameBox.text!
        friendNameView.text = friendNameBox.text!
    }

    @IBAction func mealCostChanged(_ sender: Any) {
        mealCost = NSString(string: mealCostBox.text!).doubleValue
        taxCost = mealCost * taxPercentage
        tipCost = mealCost * tipPercentage
        mealCost = mealCost + tipCost + taxCost
        let roundedMealCost = NSString(format: "%.2f", mealCost)
        
        dollarTotalView.text = ("$\(roundedMealCost)")
    }
    
    @IBAction func tipPercentageChanged(_ sender: Any) {
        tipPercentage = (NSString(string: tipPercentageBox.text!).doubleValue)/100
        tipCost = mealCost * tipPercentage
        taxCost = mealCost * taxPercentage
        var total = tipCost + taxCost
        total = total + mealCost
        let roundedTotal = NSString(format: "%.2f", total)
        
        dollarTotalView.text = ("$\(roundedTotal)")
    }
    
    @IBAction func taxPercentageChanged(_ sender: Any) {
        taxPercentage = (NSString(string: taxPercentageBox.text!).doubleValue)/100
        taxCost = mealCost * taxPercentage
        tipCost = mealCost * tipPercentage
        var total = tipCost + taxCost
        total = total + mealCost
        let roundedTotal = NSString(format: "%.2f", total)
        
        dollarTotalView.text = ("$\(roundedTotal)")
    }
    
    @IBAction func addMeal(_ sender: Any) {
        mealObject.friendName = friendName
        mealObject.mealCost = mealCost
        mealObject.tipCost = tipCost
        mealObject.taxCost = taxCost
        mealObject.tipPercentage = tipPercentage
        mealObject.taxPercentage = taxPercentage
        ViewController.sharedInstance?.acceptData(data: mealObject, vc: self)
    }
    
    // Start Editing The Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -250, up: true)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -250, up: false)
    }
    
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}
