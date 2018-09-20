//
//  ToukouListTableViewCell.swift
//  
//
//  Created by Tomita on 2018/09/20.
//

import UIKit

class ToukouListTableViewCell: UITableViewCell {
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    
    var post: Post! {
        didSet{
            updateUI()
        }
        
    }
    
    func updateUI() {
        var images = [ UIImage(named: "s1"), UIImage(named: "s2"), UIImage(named: "s3"), UIImage(named: "s4") ]
        let index = (Int)(arc4random_uniform(4))
        image1.image = images[index]
        image2.image = images[index]
        image3.image = images[index]
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
