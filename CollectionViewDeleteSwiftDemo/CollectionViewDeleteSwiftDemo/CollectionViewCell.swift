//
//  CollectionViewCell.swift
//  CollectionViewDeleteSwiftDemo
//
//  Created by 咖啡糖 on 2019/12/23.
//  Copyright © 2019 咖啡糖. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setLabelText(text:String){
        label.text = text
    }
    //与CollectionViewDeleteDemo实现逻辑一样，使用递归查找父视图使用绑定对象解耦
    func addGesture(){
        let swipGesture : UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(swipGestureMethod(_ :)))
        swipGesture.direction = .left
        self.addGestureRecognizer(swipGesture)
       
    }
    @objc func swipGestureMethod(_ gesture:UISwipeGestureRecognizer){
        switch gesture.direction {
        case .left:
            UIView.animate(withDuration: 0.1, animations: {
                self.label.center = CGPoint.init(x: self.label.center.x - 60 , y: self.label.center.y)
            }) { (true) in
                
            }
        case .right:
            print("右滑了")
        case .up:
            print("上滑了")
        case .down:
            print("下滑了")
        default:
            print("滑动default")
        }
    }
    override var isSelected: Bool{
        set{
//            print("重写的cell属性--select中的set方法")
        }
        get{
//            print("重写的cell属性--select中的get方法")
            return true
        }
    }
}
