//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Juan Jose Gomez Medina on 2/15/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var TweetContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
