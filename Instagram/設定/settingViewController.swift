//
//  settings.swift
//  Instagram
//
//  Created by Tomita on 2018/06/11.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit

class settingViewController: UITableViewController {
    
    let settingMenu: [[String]] = [
                                    ["自分のページ", "キープ一覧", "フォローリクエスト", "ブロック・ミュートリスト"],
                                    ["SNS連携", "通知設定", "使い方", "利用規約とプライバリーポリシー", "お問い合わせ", "アプリ情報", "ログアウト"]
                                  ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2 //セクションの数
        
    }
    
//    override func tableView(_ tableView: UITableView,
//                   titleForHeaderInSection section: Int) -> String? {
//
//
//        return sectionTitle //sectionのタイトル
//    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // HeaderのViewを作成してViewを返す
        let headerView = UIView()
        let label : UILabel = UILabel()
        
        label.backgroundColor = .clear //省略可 UIColor.clear
        label.textColor = UIColor.clear

//        headerView.backgroundColor = UIColor.white
        headerView.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingMenu[section].count //各セクション内の要素の数
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = settingMenu[indexPath.section][indexPath.row]
        
        return cell
    }
    
    //フッタ(下の線)
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear //お好きな色に
        return view
    }
    
    //セルをタップした際の挙動を記述
    override func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let storyboard: UIStoryboard = UIStoryboard(name: "ScrollTabPageViewController", bundle: nil)
                let nextView = storyboard.instantiateInitialViewController()
                self.navigationController!.pushViewController(nextView!, animated: true)

//                self.performSegue(withIdentifier: "mypageSegue", sender: nil)
            }
        } else if indexPath.section == 1 {
            
            
        }
    }
    
}
