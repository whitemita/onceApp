//
//  ViewController.swift
//  Instagram
//
//  Created by Tomita on 2018/05/13.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var post: [Post] = Post.allPosts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "postCell")
        tableView.showsVerticalScrollIndicator = false //スクロールバーを非表示にしている
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension  //自動でセルの高さを調節してくれるやつ
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func openMypage(openUser: User) {
//        let storyboard: UIStoryboard = self.storyboard!
//        let nextView = storyboard.instantiateViewController(withIdentifier: "ScrollTabPageViewControllerView") as! ScrollTabPageViewController
//        nextView.user = openUser
//        self.navigationController?.pushViewController(nextView, animated: true)
        let storyboard: UIStoryboard = UIStoryboard(name: "ScrollTabPageViewController", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController() as! ScrollTabPageViewController
        //ここでユーザーを登録しているので、自分の情報を代入する
        nextView.user = openUser
        self.navigationController!.pushViewController(nextView, animated: true)

    }
    
}


extension TimeLineViewController: UITableViewDataSource,TableViewCellDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
     return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.post = post[indexPath.row]
        cell.delegate = self
        return cell
    }

    
}




















