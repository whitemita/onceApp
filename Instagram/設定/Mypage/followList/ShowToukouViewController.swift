//
//  ShowToukouViewController.swift
//  Instagram
//
//  Created by Tomita on 2018/09/17.
//  Copyright © 2018年 Tomita. All rights reserved.
//

import UIKit

class ShowToukouViewController: UIViewController {
    var post: [Post] = Post.allPosts //表示する投稿を配列に用意する
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.dataSource = self
        collectionview.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollTabPageViewController.updateLayoutIfNeeded()
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

extension ShowToukouViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100//post.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                               for: indexPath)
        
//        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
//        let cellImage = post[indexPath.row].postImage //UIImage(named: )
//        // UIImageをUIImageViewのimageとして設定
//        imageView.image = cellImage
        
        let label = cell.contentView.viewWithTag(2) as! UILabel
        label.text = String(indexPath.row + 1)
        return cell
    }
    
}

extension ShowToukouViewController {
    /**
     viewControllerへのスクロールを検知
     - parameter scrollView: scrollView
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // contentsViewのスクロールを同期
        scrollTabPageViewController.updateContentViewFrame()
    }
    var scrollTabPageViewController: ScrollTabPageViewController {
        return parent as! ScrollTabPageViewController
    }
    
    var scrollView: UIScrollView {
        return collectionview
    }
}



