//
//  User.swift
//  Twitter
//
//  Created by Ryosuke Fukuda on 8/15/15.
//  Copyright (c) 2015 Ryochan. All rights reserved.
//

import UIKit

class User {
    
    var id: String
    var fullName: String
    var email: String
    var profileImage: UIImage!
    var profileHeaderImage: UIImage!
    var interestId = [String]()
    var selfIntro: String!
    
    var followUser: [User]!
    var followerUser: [User]!
    var likePost: [Post]!
    
    
    init(id: String, fullName: String, email: String, profileImage: UIImage, headerImage: UIImage!, selfIntro: String) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.profileImage = profileImage
        self.profileHeaderImage = headerImage
        self.selfIntro = selfIntro
    }
    
    class func testUser() -> User {
    return User(id: "test", fullName: "test", email: "test", profileImage: UIImage(named: "f1")!, headerImage: UIImage(named: "s2")!, selfIntro: "こんにちは")
    }
    
    // MARK: - Private
    
    class func allUsers() -> [User]
    {
        return [
            User(id: "keru_mai", fullName: "高田 間位毛流", email: "steave@info.com", profileImage: UIImage(named: "f5")!, headerImage: UIImage(named: "s4")!, selfIntro: "こんにちは"),
            User(id: "singen_takeda", fullName: "武田信玄", email: "mark@info.com", profileImage: UIImage(named: "f3")!, headerImage: UIImage(named: "s3"), selfIntro: "こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは"),
            User(id: "yoshiko_takaoka", fullName: "高岡佳子", email: "yossy@info.com", profileImage: UIImage(named: "f2")!, headerImage: UIImage(named: "s2"), selfIntro: "私の名前は高岡佳子。盆栽が趣味です。皆様仲良くしてください、よろしくどうぞ"),
            User(id: "nana_komatsu", fullName: "小松菜奈", email: "nana@info.com", profileImage: UIImage(named: "f4")!, headerImage: UIImage(named: "s1"), selfIntro: "山梨県内の私立高校を卒業しました。両親は佐賀県と沖縄県の出身です。兄が2人います。趣味はカメラ、ショッピング。特技はダンス、フルート。高校時代はチアリーディング部でした。ゲームはほとんどやらないけど、パズルゲームアプリの『Q』にハマっています。仲の良いモデルは、撮影現場で知り合ったemma。2人で韓国旅行へ行くほどの仲です。2人は「えまなな」と呼ばれています。憧れの女優は蒼井優さんです。清野菜名ちゃんとも仲良し。名が同じ読みで「なな」である為、それぞれ間柄での愛称は「こっちゃん」（小松）、「せっちゃん」（清野）と呼ぶ仲です。")
        ]
    }

    
    
}
