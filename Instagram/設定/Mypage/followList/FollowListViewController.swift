//
//  File.swift
//  Instagram
//
//  Created by Tomita on 2018/08/25.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit

class FollowListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 120
        if UITableViewAutomaticDimension > 120 {
            tableView.rowHeight = UITableViewAutomaticDimension  //自動でセルの高さを調節してくれるやつ
        } else {
            tableView.rowHeight = 120
        }
        let nib = UINib(nibName: "FollowListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "followListCell")
//        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "postCell")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollTabPageViewController.updateLayoutIfNeeded()
    }
}


// MARK: - UITableVIewDataSource

extension FollowListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "followListCell", for: indexPath) as! FollowListTableViewCell
        cell.userNameLabel?.text = String(indexPath.row)
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
//        cell.textLabel?.text = String(indexPath.row)
        
//         let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "followListCell")
//         cell.textLabel?.text = String(indexPath.row)
        return cell
    }


}


// MARK: - UIScrollViewDelegate

extension FollowListViewController: UITableViewDelegate {
    /**
     viewControllerへのスクロールを検知
     - parameter scrollView: scrollView
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // contentsViewのスクロールを同期
        scrollTabPageViewController.updateContentViewFrame()
    }
}


// MARK: - ScrollTabPageViewControllerProtocol

extension FollowListViewController: ScrollTabPageViewControllerProtocol {
    
    var scrollTabPageViewController: ScrollTabPageViewController {
        return parent as! ScrollTabPageViewController
    }
    
    var scrollView: UIScrollView {
        return tableView
    }
}
