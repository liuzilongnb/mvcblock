//
//  HomeViewController.swift
//  mvcblock
//
//  Created by admin on 17/4/20.
//  Copyright © 2017年 刘子龙. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView:HomeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView = HomeView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.view.addSubview(homeView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
