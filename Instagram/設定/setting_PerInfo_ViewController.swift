//
//  setting_PerInfo_ViewController.swift
//  Instagram
//
//  Created by Tomita on 2018/08/22.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit

class setting_PerInfo_ViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userId: UILabel!
    
    var user: User! {
        didSet{
            updateUI()
        }
        
    }
    
    
    func updateUI() {                                             //didsetした時に画面上に表示することをかく
        
        profilePic.layer.cornerRadius = profilePic.bounds.width/2 //画像を円にする
        profilePic.clipsToBounds = true                       //変更を有効(?)にする
        
        profilePic.image! = user.profileImage
        userName.text! = user.fullName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        user = User.allUsers()[1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
