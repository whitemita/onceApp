//
//  AppDelegate.swift
//  Instagram
//
//  Created by Tomita on 2018/05/13.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let ud = UserDefaults.standard
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        //falseに初期化してます
        ud.register(defaults: [ "isLogin" : false])
        let islogin: Bool? = ud.bool(forKey: "isLogin")
        
        
        //ユーザーがいる場合Storyboard上のタイムラインへ
        if (islogin == true) {
            //windowを生成
            self.window = UIWindow(frame: UIScreen.main.bounds)
            //Storyboardを指定
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //Viewcontrollerを指定
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "logined")
            //rootViewControllerに入れる
            self.window?.rootViewController = initialViewController
            //表示
            self.window?.makeKeyAndVisible()
        }else{
            //ユーザーがいない場合そのままサインイン画面へ
        }
        //Firebaseの有効化
        FirebaseApp.configure()

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

