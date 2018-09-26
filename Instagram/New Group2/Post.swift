//
//  Post.swift
//  Twitter
//
//  Created by Ryosuke Fukuda on 8/15/15.
//  Copyright (c) 2015 Ryochan. All rights reserved.
//

import UIKit

class Post {
    
    // プロパティー
    var id: String
    var user: User
    var createdAt: String
    var postImage: UIImage!     // 写真がない可能性もある
    var postText: String
    var numberOfLikes: Int = 0
    
    var userDidLike = false
    
    // このIDはParseからデータを習得するときに必要
    let interestId: String
    
    // ポストIDはポストのデータを習得するときに必要
    
    init(postId: String, author: User, createdAt: String, postImage: UIImage!, postText: String, numberOfLikes: Int, interestId: String, userDidLike: Bool)
    {
        self.id = postId
        self.user = author
        self.createdAt = createdAt
        self.postImage = postImage      // なしでもOK
        self.postText = postText
        self.numberOfLikes = numberOfLikes
        self.interestId = interestId
        self.userDidLike = userDidLike
    }
    

    //Sampleデータ
    static let allPosts = [
        Post(postId: "s4", author: User.allUsers()[1], createdAt: "2018/8/22", postImage: UIImage(named: "s1")!, postText: "今日はここに行ってきました！景色も綺麗でとても楽しかったです！笑", numberOfLikes: 12, interestId: "i1", userDidLike: true),
        Post(postId: "s3", author: User.allUsers()[0], createdAt: "2018/8/23", postImage: UIImage(named: "s4")!, postText: "海外は一度みんな行くべき。人生が変わるよ。お金がないなんて言ってないで行動した人が勝つ。奨学金でも、親から借りるでも、いろんな道がある。できない言い訳を考えるだけ無駄。", numberOfLikes: 12, interestId: "i2", userDidLike: true),
        Post(postId: "s3", author: User.allUsers()[2], createdAt: "2018/8/24", postImage: UIImage(named: "s5")!, postText: "最近できた大学の友達と！！ずっともになりそうな予感！！！！マジこの面子楽しいからわたし幸せ者だわWWWWWWW", numberOfLikes: 16, interestId: "i4", userDidLike: false),
        Post(postId: "s6", author: User.allUsers()[3], createdAt: "2018/8/25", postImage: UIImage(named: "s6")!, postText: "最近旅行に行ってないから時間ができたら旅行したいな〜最近旅行に行ってないから時間ができたら旅行したいな〜", numberOfLikes: 100, interestId: "t2", userDidLike: true),
    ]
    
    
}
