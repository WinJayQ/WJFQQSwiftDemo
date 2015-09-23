//
//  MessageViewController.swift
//  WJFQQDemo
//
//  Created by jh navi on 15/9/11.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //划动手势
        //右划
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipeGesture:")
        self.view.addGestureRecognizer(swipeGesture)
    
        //左侧显示头像
        let photoView: UIImageView = UIImageView(image: UIImage(named: "AppIcon-160x60@2x.png"))
        photoView.frame = CGRectMake(0, 0, 30, 30)
        let photoItem: UIBarButtonItem = UIBarButtonItem(customView: photoView)
        self.navigationItem.leftBarButtonItem = photoItem
        
        //添加点击事件
        photoView.userInteractionEnabled = true  //设置允许交互属性
        
        //添加tapGuestureRecognizer手势
        let tapGR = UITapGestureRecognizer(target: self, action: "showSliderView:")
        photoView.addGestureRecognizer(tapGR)

        //头像变圆形（设弧度为宽度的一半）
        photoView.clipsToBounds = true
        photoView.layer.cornerRadius = photoView.bounds.width*0.5
        //设置titleView为
        let titleSegment: UISegmentedControl = UISegmentedControl(items: ["消息","电话"])
        titleSegment.selectedSegmentIndex = 0
        self.navigationItem.titleView = titleSegment
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //手势处理函数
    func showSliderView(sender:UITapGestureRecognizer) {
        NSLog("侧滑视图")
        let sliderVC: UIViewController! = self.storyboard!.instantiateViewControllerWithIdentifier("SliderViewController") 
        self.presentViewController(sliderVC, animated: false, completion: nil)
    }
    
    func handleSwipeGesture(sender:UISwipeGestureRecognizer){
        let sliderVC: UIViewController! = self.storyboard!.instantiateViewControllerWithIdentifier("SliderViewController") 
        
        //划动的方向
        let direction = sender.direction
        //判断是上下左右
        switch (direction){
        case UISwipeGestureRecognizerDirection.Right:
            print("Right")
            self.presentViewController(sliderVC, animated: false, completion: nil)
            break
        default:
            break;
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
