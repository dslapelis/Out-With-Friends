//
//  AddMealViewController.swift
//  Out With Friends
//
//  Created by Daniel Slapelis on 3/13/17.
//  Copyright © 2017 Dream Development. All rights reserved.
//

import UIKit

class AddMealViewController: UIViewController {

    @IBOutlet weak var friendNameView: UILabel!
    @IBOutlet weak var dollarTotalView: UILabel!
    @IBOutlet weak var friendNameBox: AddMealTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        friendNameBox.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldDidChange(_ textField: UITextField) {
        friendNameView.text = friendNameBox.text
    }

}
