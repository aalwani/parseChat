//
//  PostTableViewCell.swift
//  parseChat
//
//  Created by Aanya Alwani on 6/21/16.
//  Copyright © 2016 Aanya Alwani. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
