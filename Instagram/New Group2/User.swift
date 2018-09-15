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
    
    init(id: String, fullName: String, email: String, profileImage: UIImage, headerImage: UIImage!, selfIntro: String) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.profileImage = profileImage
        self.profileHeaderImage = headerImage
        self.selfIntro = selfIntro
    }
    
    // MARK: - Private
    
    class func allUsers() -> [User]
    {
        return [
            User(id: "keru_mai", fullName: "マイケル", email: "steave@info.com", profileImage: UIImage(named: "f1")!, headerImage: UIImage(named: "s1")!, selfIntro: "こんにちは"),
            User(id: "singen_takeda", fullName: "武田信玄", email: "mark@info.com", profileImage: UIImage(named: "f2")!, headerImage: UIImage(named: "s2"), selfIntro: "こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは")
        ]
    }

    
    
}
