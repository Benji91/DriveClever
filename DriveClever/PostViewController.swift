//
//  PostViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/2/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var typeLabel: UITextField!
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func submitButtonAction(sender: AnyObject) {
        let title = titleLabel.text
        let type = typeLabel.text
        let location = locationLabel.text
        let address = addressLabel.text
        print(title!+type!+location!+address!)
    }
    
    
    // MARK : - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
