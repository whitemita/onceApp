//
//  LoginViewController.swift
//  Instagram
//
//  Created by Tomita on 2018/06/17.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseAuthUI

//import FirebaseFacebookAuthUI
//import FirebaseTwitterAuthUI
//import FirebasePhoneAuthUI
//import FirebaseGoogleAuthUI


class LoginViewController: UIViewController {

    @IBOutlet weak var mailAdress: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    
    @IBAction func loginPushed(_ sender: UIButton) {
        let ud = UserDefaults.standard
        Auth.auth().signIn(withEmail: mailAdress.text!, password: pass.text!) { (user, error) in
            
            if error != nil {
                
                print("ログインできませんでした")
                
            }
            else {
                
                ud.set(true, forKey: "isLogin")
                ud.synchronize()
                self.performSegue(withIdentifier: "Logined", sender: user?.uid)
            }
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
