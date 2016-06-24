//
//  LoginViewController.swift
//  parseChat
//
//  Created by Aanya Alwani on 6/21/16.
//  Copyright © 2016 Aanya Alwani. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func SignIn(sender: AnyObject) {
        //var x: String = "Incorrect email or password"
        let alertController = UIAlertController(title: "Error", message: "Incorrect email or password", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            
        }
        
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default)  { (action) in
            
        }
        
        
        alertController.addAction(OKAction)
        
        PFUser.logInWithUsernameInBackground(emailField.text!, password: passwordField.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("YAY")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            } else {
                //x = error!.localizedDescription as! String
                self.presentViewController(alertController, animated: true, completion: nil)
                
           
            }
        }
    }
    
    @IBAction func SignUp(sender: AnyObject) {
        
        let newUser = PFUser()
        newUser.username = emailField.text
        newUser.email = emailField.text
        newUser.password = passwordField.text
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if let error = error
            {
                let alertController = UIAlertController(title: error.localizedDescription, message: "", preferredStyle: .Alert)
                
                                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                                }
                
                                alertController.addAction(cancelAction)
                
                                let OKAction = UIAlertAction(title: "OK", style: .Default)  { (action) in
                
                                }
                
                                alertController.addAction(OKAction)
                                
                                self.presentViewController(alertController, animated: true, completion: nil)
            } else {
                print("Yay")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                
            }}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
