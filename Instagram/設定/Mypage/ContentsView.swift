//
//  ContentsView.swift
//  ScrollTabPageViewController
//
//  Created by EndouMari on 2015/12/06.
//  Copyright © 2015年 EndouMari. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ContentsView: UIView {

    // 選択されているtabボタンのindex
    var currentIndex: Int = 0
    
    var tabButtonPressedBlock: ((_ index: Int) -> Void)?
    var scrollDidChangedBlock: ((_ scroll: CGFloat, _ shouldScroll: Bool) -> Void)?

    // スクロール開始時点の初期値
    var scrollStart: CGFloat = 0.0

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var segmentedControlWidth: NSLayoutConstraint!
    @IBOutlet weak var segmentedControlHeight: NSLayoutConstraint!

    //自分で追加したメソッド↓
    let underlineLayer = CAShapeLayer()
    let selectItemLineLayer = CALayer()
    var segmentItemWidth:CGFloat = 0  //後で使うので宣言しておきます。
    
/*    override func layoutSubviews() {
        //選択されたsegmentItemの下線部の実現
        segmentItemWidth = self.frame.width / 4
        selectItemLineLayer.backgroundColor = UIColor.black.cgColor
        let iti = CGFloat(currentIndex) * self.frame.width / 4
        selectItemLineLayer.frame = CGRect(x: iti, y: 41.0, width: segmentItemWidth , height: 2.5)

        //うっすい下線部の実現
        underlineLayer.strokeColor = UIColor.gray.cgColor
        underlineLayer.lineWidth = 0.5
        let line = UIBezierPath()
        line.move   (to: CGPoint( x: 0, y: 43.8) ) //始点
        line.addLine(to: CGPoint( x: self.frame.width, y: 43.8))            //終点
        line.close()  //線を結ぶ
        underlineLayer.path = line.cgPath

        segmentedControl.layer.addSublayer(underlineLayer)
        segmentedControl.layer.addSublayer(selectItemLineLayer)

        //tintとbackgroundの色を変更している
        segmentedControl.tintColor = UIColor.clear
        segmentedControl.backgroundColor = UIColor.clear
        //文字色を変更している
        let attribute  = [NSAttributedStringKey.foregroundColor:UIColor.darkGray]
        let attribute2 = [NSAttributedStringKey.foregroundColor:UIColor.black]
        segmentedControl.setTitleTextAttributes(attribute, for: UIControlState.normal)
        segmentedControl.setTitleTextAttributes(attribute2, for: UIControlState.selected)

    }
 */
    
    
    
    let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        sharedInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    private func sharedInit() {
        Bundle.main.loadNibNamed("ContentsView", owner: self, options: nil)
        addSubview(contentView)

        self.setupConstraints()

        scrollView.delegate = self
        scrollView.scrollsToTop = false
    }
}


// MARK: - View

extension ContentsView {

    // 制約を更新 & 初期設定している
    func setupConstraints() {
        let topConstraint = NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20.0)

        let bottomConstraint = NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)

        let leftConstraint = NSLayoutConstraint(item: contentView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0)

        let rightConstraint = NSLayoutConstraint(item: contentView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0)

        let constraints = [topConstraint, bottomConstraint, leftConstraint, rightConstraint]

        contentView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(constraints)

        //選択されたsegmentItemの下線部の実現
        segmentItemWidth = self.frame.width / 4
        selectItemLineLayer.backgroundColor = UIColor.black.cgColor
        selectItemLineLayer.frame = CGRect(x: 0, y: 41.0, width: segmentItemWidth , height: 2.5)
        
        //うっすい下線部の実現
        underlineLayer.strokeColor = UIColor.gray.cgColor
        underlineLayer.lineWidth = 0.5
        let line = UIBezierPath()
        line.move   (to: CGPoint( x: 0, y: 43.8) ) //始点
        line.addLine(to: CGPoint( x: self.frame.width, y: 43.8))            //終点
        line.close()  //線を結ぶ
        underlineLayer.path = line.cgPath
        
        segmentedControl.layer.addSublayer(underlineLayer)
        segmentedControl.layer.addSublayer(selectItemLineLayer)
        
        //tintとbackgroundの色を変更している
        segmentedControl.tintColor = UIColor.clear
        segmentedControl.backgroundColor = UIColor.clear
        //文字色を変更している
        let attribute  = [NSAttributedStringKey.foregroundColor:UIColor.darkGray]
        let attribute2 = [NSAttributedStringKey.foregroundColor:UIColor.black]
        segmentedControl.setTitleTextAttributes(attribute, for: UIControlState.normal)
        segmentedControl.setTitleTextAttributes(attribute2, for: UIControlState.selected)

    }

    /**
     tabボタンのindex番号を更新
     - parameter index: 更新しようとしているindex番号
     - parameter animated: アニメーションするかのBOOL
     */
    func updateCurrentIndex(index: Int, animated: Bool) {
        segmentedControl.selectedSegmentIndex = index
        let x = CGFloat( segmentedControl.selectedSegmentIndex ) * (self.frame.width / 4)
        selectItemLineLayer.frame.origin.x = x
        currentIndex = index
    }
}


// MARK: - UIScrollViewDelegate

extension ContentsView: UIScrollViewDelegate {

    /**
     contentsViewへのスクロールを検知
     - parameter scrollView: scrollView
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > statusBarHeight {
            scrollDidChangedBlock?(scrollView.contentOffset.y, true)
            scrollView.contentOffset.y = statusBarHeight
        } else if scrollView.contentOffset.y > 0.0 {
            scrollDidChangedBlock?(scrollView.contentOffset.y, true)
            scrollView.contentOffset.y = 0.0
        } else if frame.minY < 0.0 {
            scrollDidChangedBlock?(scrollView.contentOffset.y, true)
            scrollView.contentOffset.y = 0.0
//        } else if scrollView.contentOffset.y > -380{
//            scrollDidChangedBlock?(scrollView.contentOffset.y, true)
//            scrollView.contentOffset.y = 0.0
        } else {
            let scroll = scrollView.contentOffset.y - scrollStart
            scrollDidChangedBlock?(scroll, false)
            scrollStart = scrollView.contentOffset.y
        }
    }
}


// MARK: - IBAction

extension ContentsView {
    //セグメントのアイテムを選択した時の挙動
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        tabButtonPressedBlock?(sender.selectedSegmentIndex)
        updateCurrentIndex(index: sender.selectedSegmentIndex, animated: true)
    }
}

class newSegmentedControl: UISegmentedControl{
    
//    override open var selectedSegmentIndex: Int = 0
}











