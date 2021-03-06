//
//  ScrollTabPageViewController.swift
//  ScrollTabPageViewController
//
//  Created by EndouMari on 2015/12/04.
//  Copyright © 2015年 EndouMari. All rights reserved.
//

import UIKit

protocol ScrollTabPageViewControllerProtocol {
    var scrollTabPageViewController: ScrollTabPageViewController { get }
    var scrollView: UIScrollView { get }
}

class ScrollTabPageViewController: UIPageViewController {


    
    var pageViewControllers: [UIViewController] = []
    
    // pageViewControllerの更新index
    var updateIndex: Int = 0
    
    var contentsView: ContentsView!
    
    // contentViewの高さ
    var contentViewHeight: CGFloat = 380.0
   // contentsViewのスクロールの値
    var scrollContentOffsetY: CGFloat = 0.0
    
    var shouldScrollFrame: Bool = true
    var shouldUpdateLayout: Bool = false
    var statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    var navigationBarHeight : CGFloat?
    
    var user: User! {
        didSet{
            updateUser()
        }
        
    }
    
    func updateUser() {
       
    }
    
    // tabViewControllerの現在のindex
    var currentIndex: Int? {
        guard let viewController = viewControllers?.first, let index = pageViewControllers.index(of: viewController) else {
            return nil
        }
        return index
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
        //エラー吐かないように仮の値を設定しているだけ
        if ( navigationBarHeight == nil) {navigationBarHeight = 0}
        
        
        self.setupOutlets()

    }
}


// MARK: - View

extension ScrollTabPageViewController {

    // outletをセットアップ
    func setupOutlets() {
        setupViewControllers()
        setupContentsView()
        setupPageViewController()
        //user情報の設定
        contentsView.user = self.user
    }

    // viewControllerをセットアップ
    // 別々のviewControllerを設定する場合はvc毎の読み込み内容を変更する
    func setupViewControllers() {
        // viewContrroller
        let sb1 = UIStoryboard(name: "ToukouListViewController", bundle: nil)
        let vc1 = sb1.instantiateViewController(withIdentifier: "ToukouListViewController")

        // viewContrroller
        let sb2 = UIStoryboard(name: "FollowListViewController", bundle: nil)
        let vc2 = sb2.instantiateViewController(withIdentifier: "FollowListViewController")
        
        // viewContrroller
        let sb3 = UIStoryboard(name: "FollowListViewController", bundle: nil)
        let vc3 = sb3.instantiateViewController(withIdentifier: "FollowListViewController")
        
        // viewContrroller
        let sb4 = UIStoryboard(name: "FollowListViewController", bundle: nil)
        let vc4 = sb4.instantiateViewController(withIdentifier: "FollowListViewController")

        pageViewControllers = [vc1, vc2, vc3, vc4]
    }

    // pageViewControllerをセットアップする
    func setupPageViewController() {
        dataSource = self
        delegate = self

        // 初回表示のviewControllerをセット
        setViewControllers([pageViewControllers[0]],
            direction: .forward,
            animated: false,
            completion: { [weak self] (completed: Bool) in
                self?.setupCurrentContentInset()
            })
    }

    // contentsViewのセットアップ
    func setupContentsView() {
        contentsView = ContentsView(frame: CGRect(x:0.0, y:0.0, width:view.frame.width, height:contentViewHeight))
        
        // タブボタンがタップされた時のブロック
        contentsView.tabButtonPressedBlock = { [weak self] (index: Int) in
            guard let uself = self else {
                return
            }

            uself.shouldUpdateLayout = true
            uself.updateIndex = index
            let direction: UIPageViewControllerNavigationDirection = (uself.currentIndex! < index) ? .forward : .reverse
            uself.setViewControllers([uself.pageViewControllers[index]],
                direction: direction,
                animated: true,
                completion: { [weak self] (completed: Bool) in
                    guard let uself = self else {
                        return
                    }
                    if uself.shouldUpdateLayout {
                        uself.setupContentOffsetY(index:index, scroll: -uself.scrollContentOffsetY)
                        uself.shouldUpdateLayout = false
                    }
                })
            
        }

        // contentViewのスクロール表示が変更された時のブロック
        contentsView.scrollDidChangedBlock = { [weak self] (scroll: CGFloat, shouldScrollFrame: Bool) in
            self?.shouldScrollFrame = shouldScrollFrame
            // Y座標を更新する
            self?.updateContentOffsetY(scroll: scroll)
        }
        //user情報の設定
        contentsView.user = self.user
        view.addSubview(contentsView)
    }
}


// MARK: - updateScroll

extension ScrollTabPageViewController {

    /**
     現在のscrollViewのcontentInsetをセット
     */
    func setupCurrentContentInset() {
        guard let currentIndex = currentIndex, let vc = pageViewControllers[currentIndex] as? ScrollTabPageViewControllerProtocol else {
            return
        }

        vc.scrollView.contentInset.top = contentViewHeight
        vc.scrollView.scrollIndicatorInsets.top = contentViewHeight
    }
    
    /**
     次のscrollViewのcontentInsetをセット
     */
    func setupNextContentInset(nextIndex:Int) {
        guard let vc = pageViewControllers[nextIndex] as? ScrollTabPageViewControllerProtocol else {
            return
        }
        
        vc.scrollView.contentInset.top = contentViewHeight
        vc.scrollView.scrollIndicatorInsets.top = contentViewHeight
    }

    /**
     Y座標をセット(初期表示やページングがされた時)
     - parameter index: ページングのindex
     - parameter scroll: どれだけスクロールしているか
     */
    func setupContentOffsetY(index: Int, scroll: CGFloat) {
        guard let  vc = pageViewControllers[index] as? ScrollTabPageViewControllerProtocol else {
            return
        }

        if scroll == 0.0 {
            vc.scrollView.contentOffset.y = -contentViewHeight
        } else if (scroll < contentViewHeight - contentsView.segmentedControlHeight.constant) || (vc.scrollView.contentOffset.y <= -contentsView.segmentedControlHeight.constant) {
            vc.scrollView.contentOffset.y = scroll - contentViewHeight
        } 
    }

    /**
     viewControllerのスクロールでのcontentViewを更新
     - parameter scroll: 移動した分の座標
     */
    func updateContentView(scroll: CGFloat) {
        if shouldScrollFrame {
            contentsView.frame.origin.y = scroll
            scrollContentOffsetY = scroll
        }
        shouldScrollFrame = true
    }

    /**
     Y座標を更新
     - parameter scroll: 移動した分の座標
     */
    func updateContentOffsetY(scroll: CGFloat) {
        if let currentIndex = currentIndex,
            let vc = pageViewControllers[currentIndex] as? ScrollTabPageViewControllerProtocol {
            vc.scrollView.contentOffset.y += scroll
        }
    }
    
    

    func updateContentViewFrame() {
        guard let currentIndex = currentIndex, let vc = pageViewControllers[currentIndex] as? ScrollTabPageViewControllerProtocol else {
            return
        }

        // 予めスクロールのcontentOffsetはcontentsViewの分だけ差し引かれている。
        // スクロールの長さがsegmentedControlの高さより大きいかどうか判定
    

        
        let topHight = -( navigationBarHeight! + contentsView.segmentedControlHeight.constant)
        
//      if vc.scrollView.contentOffset.y >= -contentsView.segmentedControlHeight.constant {
        if vc.scrollView.contentOffset.y >= topHight {
        
            // tableViewのスクロール更新
            let scroll = contentViewHeight + topHight
            updateContentView(scroll: -scroll)
            vc.scrollView.scrollIndicatorInsets.top = -topHight
        } else {
            // contentsViewとtableViewのスクロール更新
            let scroll = contentViewHeight + vc.scrollView.contentOffset.y
            updateContentView(scroll: -scroll)
            vc.scrollView.scrollIndicatorInsets.top = -vc.scrollView.contentOffset.y
        }
    }

    func updateLayoutIfNeeded() {
        if shouldUpdateLayout {
            let vc = pageViewControllers[updateIndex] as? ScrollTabPageViewControllerProtocol
            let shouldSetupContentOffsetY = vc?.scrollView.contentInset.top != contentViewHeight
            
            setupCurrentContentInset()
            setupContentOffsetY(index: updateIndex, scroll: -scrollContentOffsetY)
            shouldUpdateLayout = shouldSetupContentOffsetY
        }
    }
}


// MARK: - UIPageViewControllerDateSource

extension ScrollTabPageViewController: UIPageViewControllerDataSource {

    /**
     1つ目のviewControllerに戻った時の処理
     - parameter pageViewController: pageViewController
     - parameter viewController: 現在表示されている2つ目のviewController
     - returns: 1つ目に戻った時に表示されるviewController
     */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            guard var index = pageViewControllers.index(of: viewController) else {
                return nil
            }
        
//            index = index - 1
            index = currentIndex! - 1
            
            if index >= 0 && index < pageViewControllers.count {
                return pageViewControllers[index]
            }
            return nil
    }
    
    /**
     2つ目のviewControllerに進んだ時の処理
     - parameter pageViewController: pageViewController
     - parameter viewController: 現在表示されている1つ目のviewController
     - returns: 2つ目に進んだ時に表示されるviewController
     */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard var index = pageViewControllers.index(of: viewController) else {
            return nil
        }

        index = index + 1

        if index >= 0 && index < pageViewControllers.count {
            return pageViewControllers[index]
        }
        return nil
    }
}


// MARK: - UIPageViewControllerDelegate

extension ScrollTabPageViewController: UIPageViewControllerDelegate {

    /**
     スワイプでpageViewControllerで別のviewControllerに遷移する時の処理
     - parameter pageViewController: pageViewController
     - parameter pagingViewControllers: これから遷移しようとしているviewController
     */
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let vc = pendingViewControllers.first, let index = pageViewControllers.index(of: vc) {
            shouldUpdateLayout = true
            updateIndex = index
            setupNextContentInset(nextIndex: updateIndex)
        }
    }

    /**
     pageViewControllerのアニメーションが終わった時の処理
     - parameter pageViewController: pageViewController
     - parameter fisnished: アニメーション完了のBOOL値
     - parameter previousViewControllers: 遷移前のviewController
     - parameter completed: 遷移完了のBOOL値
     */
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let _ = previousViewControllers.first, let currentIndex = currentIndex else {
            return
        }

        if shouldUpdateLayout {
            setupCurrentContentInset()
            setupContentOffsetY(index: currentIndex, scroll: -scrollContentOffsetY)
        }

        if currentIndex >= 0 && currentIndex < contentsView.segmentedControl.numberOfSegments {
            contentsView.updateCurrentIndex(index: currentIndex, animated: false)
        }
    }
}
