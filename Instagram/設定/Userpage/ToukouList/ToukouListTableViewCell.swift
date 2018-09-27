//
//  ToukouListTableViewCell.swift
//  Instagram
//
//  Created by Tomita on 2018/09/28.
//  Copyright © 2018年 Tomita. All rights reserved.
//
import UIKit

class ToukouListTableViewCell: UITableViewCell {
    @IBOutlet var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    var post: Post! {
        didSet{
            updateUI()
        }
        
    }
    
    func updateUI() {
        var images = [ UIImage(named: "s1"), UIImage(named: "s2"), UIImage(named: "s3"), UIImage(named: "s4") ]
        image1.image = images[(Int)(arc4random_uniform(4))]
        image2.image = images[(Int)(arc4random_uniform(4))]
        image3.image = images[(Int)(arc4random_uniform(4))]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
