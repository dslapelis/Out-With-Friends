//
//  ViewController.swift
//  Out With Friends
//
//  Created by Daniel Slapelis on 3/13/17.
//  Copyright © 2017 Dream Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MealViewControllerDelegate {

    @IBOutlet weak var totalView: UILabel!
    @IBOutlet weak var tipDollarAndPercentView: UILabel!
    @IBOutlet weak var mealListView: UITableView!
    @IBOutlet weak var remindFriendsButton: RemindFriendButton!
    
    private var _total: Double = 0
    private var _tipTotal: Double = 0
    private var _tipPercent: Double = 0
    private var _numPeople: Double = 1
    
    var mealObjectsList = [MealObject]()
    static var sharedInstance : ViewController?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.sharedInstance = self
    }
    
    func acceptData(data: MealObject!, vc: MealViewController!) {
        mealObjectsList.append(data)
        
        _total = _total + (data.mealCost + data.tipCost + data.taxCost)
        let roundedTotal = NSString(format: "%.2f", _total)
        _tipTotal = _tipTotal + data.tipCost
        let roundedTipTotal = NSString(format: "%.2f", _tipTotal)
        _tipPercent = _tipPercent + (data.tipPercentage * 100)
        let avgPercent = _tipPercent/_numPeople
        let roundedTipPercent = NSString(format: "%.2f", avgPercent)
        _numPeople += 1
        
        totalView.text = ("$\(roundedTotal)")
        tipDollarAndPercentView.text = ("$\(roundedTipTotal) at \(roundedTipPercent)%")
        
        vc.navigationController?.popViewController(animated: true)
        mealListView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mealObjectsList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let meal = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath) as! Meal
        meal.friendNameView?.text = mealObjectsList[indexPath.row].friendName
        let share = mealObjectsList[indexPath.row].mealCost + mealObjectsList[indexPath.row].taxCost + mealObjectsList[indexPath.row].tipCost
        let roundedShare = NSString(format: "%.2f", share)
        meal.friendShareView?.text = ("$\(roundedShare)")
        return meal
    }

    
    
}


