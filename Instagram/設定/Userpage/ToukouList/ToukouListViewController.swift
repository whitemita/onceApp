//
//  ToukouListViewController.swift
//  Instagram
//
//  Created by Tomita on 2018/09/20.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit

class ToukouListViewController: UIViewController {
    
    @IBOutlet weak var ttableView: UITableView!
    
    let post: [Post] = Post.allPosts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ttableView.dataSource = self
        ttableView.delegate = self
        ttableView.estimatedRowHeight = 130
        if UITableViewAutomaticDimension > 130 {
            ttableView.rowHeight = UITableViewAutomaticDimension  //自動でセルの高さを調節してくれるやつ
        } else {
            ttableView.rowHeight = 130
        }
        let nib = UINib(nibName: "ToukouListTableViewCell", bundle: nil)
        ttableView.register(nib, forCellReuseIdentifier: "postListCell")
        //        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        //        tableView.register(nib, forCellReuseIdentifier: "postCell")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollTabPageViewController.updateLayoutIfNeeded()
    }
}


// MARK: - UITableVIewDataSource

extension ToukouListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postListCell", for: indexPath) as! ToukouListTableViewCell

        cell.post = post[0]
        
        return cell
    }
    
    
}


// MARK: - UIScrollViewDelegate

extension ToukouListViewController: UITableViewDelegate {
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

extension ToukouListViewController: ScrollTabPageViewControllerProtocol {
    
    var scrollTabPageViewController: ScrollTabPageViewController {
        return parent as! ScrollTabPageViewController
    }
    
    var scrollView: UIScrollView {
        return ttableView
    }
}
