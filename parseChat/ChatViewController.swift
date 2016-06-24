//
//  ChatViewController.swift
//  parseChat
//
//  Created by Aanya Alwani on 6/21/16.
//  Copyright © 2016 Aanya Alwani. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var texxtField: UITextField!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        loadedMessage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostTableViewCell", forIndexPath: indexPath) as! PostTableViewCell
        cell.emailField.text = "hiii"
        return cell
    }
    
    
    
    func loadedMessage() {
        var query = PFQuery(className: "Message_fbuJuly2016")
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            
        }
        return
    }
    
    
    
    @IBAction func pressedButton(sender: AnyObject)
    {
        var message = PFObject(className: "Message_fbuJuly2016")
        message["text"] = texxtField.text
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success
            {
                print("yay")
            }
            else
            {
                print(error?.localizedDescription)
            }
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
}
