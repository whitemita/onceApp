//
//  TabBarController.swift
//  Instagram
//
//  Created by Tomita on 2018/05/23.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit

class TabController: UITabBarController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    //tabコンテンツをタップした際の処理を記述
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        switch item.tag {
//        case 1:
//            PopPicSerect()
//
//        default:
//            print()
//        }
//    }
    
    func PopPicSerect() {
        
//        let camera = UIImagePickerControllerSourceType.savedPhotosAlbum
        let camera = UIImagePickerControllerSourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(camera) {     //cameraに指定の形式が入っているか確認している。
            let picker = UIImagePickerController()
            picker.sourceType = camera
            picker.delegate = self
            self.present(picker, animated: true)
        }
    }

}
