//
//  SignUpViewController.swift
//  
//
//  Created by Tomita on 2018/06/20.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var mailAdress: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var name: UITextField!
    
    @IBAction func createAccountPushed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: mailAdress.text!, password: pass.text!) { (user, error) in
            
            if error != nil {
                
                print("登録できませんでした")
            }
            else {
                print("登録完了")
                self.performSegue(withIdentifier: "created", sender: nil)

                
//            ここで名前の設定と同期をしている。
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = self.name.text
                changeRequest?.commitChanges { (error) in
                    // ...
                }
                
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
