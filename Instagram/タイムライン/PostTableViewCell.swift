//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Tomita on 2018/05/13.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    
    private var currentUserDidLike: Bool = false
    
    var post: Post! {
        didSet{
            updateUI()
        }
        
    }
    
    func updateUI() {                                                      //didsetした時に画面上に表示することをかく
        
        userProfilePic.layer.cornerRadius = userProfilePic.bounds.width/2  //画像を円にする
        postImage.layer.cornerRadius = 5.0                                 //丸みが5.0
        
        userProfilePic.clipsToBounds = true
        postImage.clipsToBounds = true                                     //この２行で変更を有効(?)にする
     
        userProfilePic.image! = post.user.profileImage
        userNameLabel.text! = post.user.fullName
        createdAt.text! = post.createdAt
        postImage.image! = post.postImage
        postText.text! = post.postText
        
        currentUserDidLike = post.userDidLike
        
        changeLikeButtonState()           //状態をセットしておく
        
        let image:UIImage = UIImage(data: UIImagePNGRepresentation(post.postImage)! )!
        postImage.image = image
        let scale = UIScreen.main.bounds.size.width/image.size.width
        postImage.translatesAutoresizingMaskIntoConstraints = true
        postImage.frame = CGRect(
            x: postImage.frame.minX,
            y: postImage.frame.minY,
            width: UIScreen.main.bounds.size.width-15,
            height: scale*image.size.height)

    }
    
    
    private func configureButtonAppearence() {
        
        likeButton.tintColor = UIColor.lightGray    //文字のカラー変更
        commentButton.tintColor = UIColor.black
        likeButton.setTitle("♡ \(post.numberOfLikes)", for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButton_pushed(_ sender: UIButton) {
        
        if currentUserDidLike {
            post.numberOfLikes = post.numberOfLikes - 1
            
        } else {
            post.numberOfLikes = post.numberOfLikes + 1
            
        }
        
        post.userDidLike = !post.userDidLike
        currentUserDidLike = post.userDidLike
        
        changeLikeButtonState()
        
    }
    
    func changeLikeButtonState() {
        
        if currentUserDidLike {
//            likeButton.backgroundColor = UIColor.yellow
            likeButton.tintColor = UIColor.black
            likeButton.setTitle("❤️ \(post.numberOfLikes)", for: .normal)
            
        }else{
//            likeButton.backgroundColor = UIColor.clear
            likeButton.tintColor = UIColor.lightGray
            likeButton.setTitle("♡ \(post.numberOfLikes)", for: .normal)
            
        }
        
    }
    


    
    
    
}
