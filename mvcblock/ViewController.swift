//
//  ViewController.swift
//  mvcblock
//
//  Created by admin on 17/4/14.
//  Copyright © 2017年 刘子龙. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userView:UserView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        userView = UserView(frame: CGRect(x: 0, y: 15, width: UIScreen.main.bounds.width   , height: 400))
        userView.selectBlock = abc
        
        //将ed方法赋给userView中的signBlock方法，并重写,实现点击userview中button可触发ed方法
        userView.signBlock = ed
        userView.loginBlock = ed
//        userView.recieve = self
//        userView.delegate = self
        /*
         {txt in
         
         print(txt)
         }

         
         
         */
        
        
        
        self.view.addSubview(userView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func login() {
        getUserInfo(acc: "admin", pas: "admin") { (resp) in
//            if let result = resp as? Dictionary<String,AnyObject> {
//                print(result)
//            } else 
            if let msg = resp as? String{
                print(msg)
            } else {
                print("发生了神秘事件！!")
            }
        }
    }
    
    func getUserInfo(acc:String,pas:String,result:@escaping ((_ resp:Any)->())) {
        if acc.isEmpty || pas.isEmpty{
            result("用户名或密码为空！")
            return
        }
        let string = String(format: "http://adongdev.top/php/route.php?zxd_path_name=login&account=%@&password=%@", acc,pas)
        if let url = URL(string: string) {
            DispatchQueue.global(qos: .default).async {
                let dat = try? Data(contentsOf: url)
                if let data = dat {
//                    let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
//                    if let j = json {
//                        result(j)
//                    } else {
//                        result("JSON解析失败！")
//                    }
                    if let str = String(data: data, encoding: .utf8) {
                        result(str)
                        print(result)
                    } else {
                        result("UTF8解码失败！")
                    }
                } else {
                    result("没有请求到数据！")
                }
            }
        } else {
            result("无效url！")
        }
    }
    
    func GetRequest()
    {
        //(1）设置请求路径
        let urlStr:NSString = String(format:"http://adongdev.top/php/route.php?zxd_path_name=login&account=%@&password=%@",userView.userNameF.text!,userView.passwordF.text!) as NSString
        let url:NSURL = NSURL(string: urlStr as String)!
        
        //(2) 创建请求对象
        let request:NSURLRequest = NSURLRequest(url: url as URL)
        
        //(3) 发送请求
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue:OperationQueue()) { (res, data, error)in
            //服务器返回：请求方式 = GET，返回数据格式 = JSON，用户名 = 123，密码 = 1233
            let  str = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)
            print(str)
            
        }
    }
    
    
    func abc(txt:String,pwd:String){
        print(txt)
        
        print(pwd)
    }
    
    func ed(){
        print("跳转")
        GetRequest()
//        let signVc = SignViewController()
        //界面跳转，需现在sb中新建navigation，并箭头指向它
//        self.navigationController?.pushViewController(signVc, animated: true)
        
    }
    
    
    
    func test() {
        print("delegate")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

