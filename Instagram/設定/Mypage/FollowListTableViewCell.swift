//
//  TableViewCell.swift
//  Instagram
//
//  Created by Tomita on 2018/09/01.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit

class FollowListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userSelfIntroLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
