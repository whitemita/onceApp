//
//  ToukouListTableViewCell.swift
//  
//
//  Created by Tomita on 2018/09/20.
//

import UIKit

class ToukouListTableViewCell: UITableViewCell {
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var widht: NSLayoutConstraint!
    @IBOutlet weak var height: NSLayoutConstraint!
    
    
    var post: Post! {
        didSet{
            updateUI()
        }
        
    }
    
    func updateUI() {
        var images = [ UIImage(named: "s1"), UIImage(named: "s2"), UIImage(named: "s3"), UIImage(named: "s4") ]
        let index = (Int)(arc4random_uniform(4))
        image1.image = images[index]
        image2.image = images[index]
        image3.image = images[index]
        aaa()
    }
    func aaa(){
        // 最大行数を指定(0は無制限)
        myLabel.numberOfLines = 0;
        
        // 表示するテキストをセット
        myLabel.text = "セルの高さが変わった時、そのセルの中にあるUILabelの高さも変えようとしているのですが、どうやっても変更することができません。セルの高さが変わる前のUILabelには3行分の文字が表示されており、それ以上は...で隠れています。そして、セルの高さが変わると同時にUILabelの全文を表示させようとしています。"
        
        // セットした文字からUILabelの幅と高さを算出
        let rect: CGSize = myLabel.sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        
        // 算出された幅と高さをセット
        myLabel.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
//        widht.constant = rect.width
//        height.constant = rect.height
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
