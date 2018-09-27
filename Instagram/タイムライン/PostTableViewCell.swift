//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Tomita on 2018/05/13.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate: class{
    func openMypage(openUser: User)
    
}

class PostTableViewCell: UITableViewCell {


    @IBOutlet weak var userProfilePic: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postTextHeight: NSLayoutConstraint!
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    
    private var currentUserDidLike: Bool = false
    
    var delegate: TableViewCellDelegate!
    
    var post: Post! {
        didSet{
            updateUI()
        }
        
    }
    
    func updateUI() {
        
        userProfilePic.layer.cornerRadius = userProfilePic.bounds.width/2  //画像を円にする
//        postImage.layer.cornerRadius = 5.0                                 //丸みが5.0
        
        userProfilePic.clipsToBounds = true
//        postImage.clipsToBounds = true                                     //この２行で変更を有効(?)にする
     
        userProfilePic.setImage(post.user.profileImage, for: .normal)
        userNameLabel.text! = post.user.fullName
//        postImage.image! = post.postImage
        postText.text! = post.postText
        labelSetting()
        currentUserDidLike = post.userDidLike
        
        changeLikeButtonState()           //状態をセットしておく
        
        constraints()
    }
    
    func constraints(){
        labelSetting()
        imageSetting(rootImage: post.postImage)
    }
    
    func labelSetting(){
        // 最大行数を指定(0は無制限)
        postText.numberOfLines = 0;
        // セットした文字からUILabelの幅と高さを算出
        let rect: CGSize = postText.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))

        // 算出された(幅と)高さをセット
        //myLabel.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        postTextHeight.constant = rect.height
//        postTextWidth.constant = frame.width
    }
    
    func imageSetting(rootImage: UIImage) {
        //画像のアスペクト比をpostImageViewにも制約として追加
        postImage.image = rootImage
        let constraint = NSLayoutConstraint(
            item: postImage,
            attribute:NSLayoutAttribute.height,
            relatedBy:NSLayoutRelation.equal,
            toItem: postImage,
            attribute: NSLayoutAttribute.width,
            multiplier: (rootImage.size.height) / (rootImage.size.width),
            constant:0)
            
            NSLayoutConstraint.activate([constraint]
        )
        //imageのwidthを画面サイズに適用する
        let image:UIImage = UIImage(data: UIImagePNGRepresentation(post.postImage)! )!
        postImage.image = image
        let scale = UIScreen.main.bounds.size.width/image.size.width
        postImage.translatesAutoresizingMaskIntoConstraints = true
        postImage.frame = CGRect(
            x: postImage.frame.minX,
            y: postImage.frame.minY,
            width: UIScreen.main.bounds.size.width,
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
    @IBAction func userProfileButton_pushed(_ sender: Any) {
        self.delegate?.openMypage(openUser: post.user)
    }
    


    
    
    
}
