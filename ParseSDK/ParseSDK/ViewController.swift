//
//  ViewController.swift
//  ParseSDK
//
//  Created by Heather Connery on 2015-11-10.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //creates a default parse user
        self.myMethod()
        //should do in dispatch
        let demoObject = PFObject(className: "Data")
        //(3)
        //let firstValue = demoObject["MyFirstValue"] as? String
        //print("\(firstValue)")
        
// //(1)       demoObject.setObject("Data", forKey: "MyFirstValue")
//        do {
//            try demoObject.save()
//        } catch {
//            print("Error")
//        }
        
//  //(2)     
        var query = PFQuery(className:"Data")
        query.getObjectInBackgroundWithId("D5NOQ5YNC2") {
            (gameScore: PFObject?, error: NSError?) -> Void in
            if error == nil && gameScore != nil {
                if let firstValue = gameScore!["MyFirstValue"] as? String {
                    self.myLabel.text = firstValue
                    print("\(firstValue)")
                }
                //OR
//                let firstValue = gameScore!["MyFirstValue"] as? String
//                self.myLabel.text = firstValue
//                print("\(firstValue!)")
               
            } else {
                print(error)
            }
        }
    }
    
    
    func myMethod() {
        var user = PFUser()
        user.username = "heather"
        user.password = "1234"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

