//
//  SliderViewController.swift
//  WJFQQDemo
//
//  Created by jh navi on 15/9/11.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

import Foundation
import UIKit


class SliderViewController: UIViewController {
    var mainContentView:UIView!
    var leftSideView:UIView!
    var rightSideView:UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubViews()
        showLeftViewController()
        
        //用mainContentView装下MainTab
        let mainTabVC: UITabBarController! = self.storyboard!.instantiateViewControllerWithIdentifier("MainTabViewController") as! UITabBarController
        mainContentView.addSubview(mainTabVC.view)
    }
    
    func initSubViews(){
        //划动手势
        //左划
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipeGesture:")
        swipeLeftGesture.direction = UISwipeGestureRecognizerDirection.Left //不设置是右
        self.view.addGestureRecognizer(swipeLeftGesture)
        
        let viewRect = self.view.bounds
        rightSideView = UIView(frame: viewRect)
        rightSideView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(rightSideView)
        
        leftSideView = UIView(frame: viewRect)
        leftSideView.backgroundColor = UIColor.darkGrayColor()
        let myImageView: UIImageView = UIImageView(image: UIImage(named: "sidebar_bg@2x.jpg"))
        leftSideView.addSubview(myImageView)
        
        let myImageView2: UIImageView = UIImageView(frame: CGRectMake(30, 220, 30, 30))
        myImageView2.image = UIImage(named: "qv_msg_bar_vip.png")
        let myLable :UILabel = UILabel(frame: CGRectMake(70, 230, 150, 20))
        myLable.text = "开通会员"
        myLable.textColor = UIColor.greenColor()
        leftSideView.addSubview(myLable)
        leftSideView.addSubview(myImageView2)
        
        self.view.addSubview(leftSideView)
        
        mainContentView = UIView(frame: viewRect)
        mainContentView.backgroundColor = UIColor.redColor()
        self.view.addSubview(mainContentView)
    }
    
    func showLeftViewController(){
        let translateX: CGFloat = 200
        let transcale: CGFloat = 0.85
        let transT: CGAffineTransform = CGAffineTransformMakeTranslation(translateX, 0)
        let scaleT: CGAffineTransform = CGAffineTransformMakeScale(transcale, transcale)
        let conT: CGAffineTransform = CGAffineTransformConcat(transT, scaleT)
        
        UIView.animateWithDuration(0.8, animations: { () -> Void in
            self.mainContentView.transform = conT
        })
    }
    
    
    func handleSwipeGesture(sender:UISwipeGestureRecognizer){
        let mainVC: UIViewController! = self.storyboard!.instantiateViewControllerWithIdentifier("MainTabViewController") 
        
        //划动的方向
        let direction = sender.direction
        //判断是上下左右
        switch (direction){
        case UISwipeGestureRecognizerDirection.Left:
            print("Left")
             self.presentViewController(mainVC, animated: false, completion: nil)
            break
        default:
            break;
        }
    }

}

