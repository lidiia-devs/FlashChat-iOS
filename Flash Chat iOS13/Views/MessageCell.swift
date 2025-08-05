//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Lidiia Diachkovskaia on 7/15/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    override func awakeFromNib() { //simmilar to viewDidLoad. This is gonna be called when we create a new messageCell from xib.
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = messageBubble.frame.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
