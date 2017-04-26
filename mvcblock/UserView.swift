//
//  UserView.swift
//  mvcblock
//
//  Created by admin on 17/4/14.
//  Copyright © 2017年 刘子龙. All rights reserved.
//

import UIKit

//public protocol UserViewDelegate : NSObjectProtocol {
//    
//    func test()
//    
//    
//}

typealias userNameBlock = (_ user:String,_ pwd:String) -> ()
typealias SignBlock = () -> ()
typealias LoginBlock = () -> ()
class UserView: UIView,UITextFieldDelegate {
    

    var userNameIcon:UIImageView!
    var passwordIcon:UIImageView!
    var userNameF:UITextField!
    var passwordF:UITextField!
    var signBtn:UIButton!
    var loginBtn:UIButton!
    var selectBlock:userNameBlock?
    var signBlock:SignBlock?
    var loginBlock:LoginBlock?
//    var _recieve:UIViewController?
//    var recieve:UIViewController?{
//        set(val){
//        signBtn.addTarget(val, action: #selector(ViewController.ed), for: .touchUpInside)
//        loginBtn.addTarget(val, action: #selector(ViewController.ed), for: .touchUpInside)
//            _recieve = val
//        }
//        get{
//        return _recieve
//        }
//    }
//    var delegate:UserViewDelegate?
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGray
        
//        self.addSubview(userName)
        
        userNameIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        userNameIcon.image = UIImage(named: "usernameIcon")

        
        passwordIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        passwordIcon.image = UIImage(named: "passwordIcon")
        
        
        userNameF = UITextField(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 30))
        userNameF.borderStyle = .roundedRect
        userNameF.clearsOnBeginEditing = true
        userNameF.adjustsFontSizeToFitWidth = true
        userNameF.leftView = userNameIcon
        userNameF.leftViewMode = .always
        userNameF.placeholder = "请输入用户名"
        userNameF.returnKeyType = .done
        userNameF.delegate = self
        
        
        self.addSubview(userNameF)
        
        
        

        
        passwordF = UITextField(frame: CGRect(x: 0, y: 140, width: UIScreen.main.bounds.width, height: 30))
        passwordF.borderStyle = .roundedRect
        passwordF.leftView = passwordIcon
        passwordF.leftViewMode = .always
        passwordF.placeholder = "请输入密码"
        passwordF.returnKeyType = .done
        passwordF.delegate = self
        
        self.addSubview(passwordF)
        
        signBtn = UIButton(type: .system)
        signBtn.frame = CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width/2, height: 30)
        signBtn.setTitle("注册", for: .normal)
        signBtn.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        signBtn.setTitleColor(UIColor.cyan, for: .normal)
        signBtn.backgroundColor = UIColor.white
        signBtn.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        self.addSubview(signBtn)
        
        loginBtn = UIButton(type: .custom)
        loginBtn.frame = CGRect(x: UIScreen.main.bounds.width/2, y: 300, width: UIScreen.main.bounds.width/2, height: 30)
        loginBtn.setTitle("登陆", for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        loginBtn.setTitleColor(UIColor.cyan, for: .normal)
        loginBtn.backgroundColor = UIColor.white
        
        self.addSubview(loginBtn)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        //收起键盘
        userNameF.resignFirstResponder()
        passwordF.resignFirstResponder()
        
        //调用selectBlock，将用户名传递给controller
        if let ab = selectBlock{
            ab(userNameF.text!,passwordF.text!)
        }
        
        
        return true
    }
    
    func signUp() {
        print("注册注册注册")
        
        if let ab = signBlock{
            ab()
        }
        
    }
    
    func login() {
        print("登陆登陆登陆")
        
        if let ab = loginBlock{
            ab()
        }
    }
//    func qwe() {
//        if delegate != nil {
//            delegate?.test()
//        }
//    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
