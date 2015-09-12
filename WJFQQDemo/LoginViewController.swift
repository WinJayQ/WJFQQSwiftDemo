//
//  LoginViewController.swift
//  WJFQQDemo
//
//  Created by jh navi on 15/9/10.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    //
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var accountBoxView: UIView!
    @IBOutlet weak var listBtn: UIButton!
    
    @IBOutlet weak var line2View: UIView!
    @IBOutlet weak var qqNumTextField: UITextField!
    @IBOutlet weak var qqPwdTextField: UITextField!
    
    @IBOutlet weak var toux1ImageView: UIImageView!
    @IBOutlet weak var toux2ImageView: UIImageView!
    
    
    override func viewDidLoad() {
        
        loginBtn.layer.cornerRadius = 4.0
        loginBtn.layer.masksToBounds = true
        //头像变圆形（设弧度为宽度的一半）
        toux1ImageView.clipsToBounds = true
        toux1ImageView.layer.cornerRadius = toux1ImageView.bounds.width*0.5
        toux2ImageView.clipsToBounds = true
        toux2ImageView.layer.cornerRadius = toux2ImageView.bounds.width*0.5
        
        self.accountBoxView.hidden = true
        self.line2View.hidden = true
        
        //动画：accountView，passwordView，loginBtn从下向上移
        UIView.animateWithDuration(0.8, animations: { () -> Void in
            let upValue:CGFloat = 200.0
            //accountView上移
            var accountFrame:CGRect = self.accountView.frame
            accountFrame.origin.y = accountFrame.origin.y - upValue
            self.accountView.frame = accountFrame
            //passwordView上移
            var passwordFram:CGRect = self.passwordView.frame
            passwordFram.origin.y = accountFrame.origin.y - upValue
            self.passwordView.frame = passwordFram
            //loginBtn上移
            var loginBtnFrame:CGRect = self.loginBtn.frame
            loginBtnFrame.origin.y = loginBtnFrame.origin.y - upValue
            self.loginBtn.frame = loginBtnFrame
            }) { (isCompletion) -> Void in
                if isCompletion {
                    NSLog("finish")
                }else{
                    NSLog("error")
                }
        }
    }
    
    @IBAction func showAccountBox(sender: UIButton) {
        if sender.selected{
            UIView.animateWithDuration(0.8, animations: { () -> Void in
                self.accountBoxView.hidden = true
                self.line2View.hidden = true
                var passwordFrame:CGRect = self.passwordView.frame
                passwordFrame.origin.y = passwordFrame.origin.y - 82.0
                self.passwordView.frame = passwordFrame
                
                var loginBtnFrame:CGRect = self.loginBtn.frame
                loginBtnFrame.origin.y = loginBtnFrame.origin.y - 82.0
                self.loginBtn.frame = loginBtnFrame
            }, completion: nil)
        }else{
            UIView.animateWithDuration(0.8, animations: { () -> Void in
                self.accountBoxView.hidden = false
                self.line2View.hidden = false
                var passwordFrame:CGRect = self.passwordView.frame
                passwordFrame.origin.y = passwordFrame.origin.y + 82.0
                self.passwordView.frame = passwordFrame
                
                var loginBtnFrame:CGRect = self.loginBtn.frame
                loginBtnFrame.origin.y = loginBtnFrame.origin.y + 82.0
                self.loginBtn.frame = loginBtnFrame
            }, completion: nil)
            
        }
        
        var nowState:Bool = self.listBtn.selected
        if nowState == true{
            self.listBtn.selected = false
        }else{
            self.listBtn.selected = true
        }
    }
    
    @IBAction func loginQQFunc(sender: UIButton) {
        if (self.qqNumTextField.text == "123456") && (self.qqPwdTextField.text == "qwert"){
            NSLog("登录成功")
            var MainVC: UIViewController! = self.storyboard!.instantiateViewControllerWithIdentifier("MainTabViewController") as! UIViewController
            self.presentViewController(MainVC, animated: true, completion: nil)
        }else{
            var alertView: UIAlertView = UIAlertView()
            alertView.title = "温馨提示"
            alertView.message = "账号：123456  密码：qwert"
            alertView.addButtonWithTitle("知道了")
            alertView.show()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
}