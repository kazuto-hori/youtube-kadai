//
//  ViewController.swift
//  youtube-kadai
//
//  Created by 堀　和人 on 2017/10/08.
//  Copyright © 2017 kazuto.hori. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {

    private var myTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = self.view.frame.width
        let height = self.view.frame.height
        
        let tabBarHeight: CGFloat = 49
        
        myTabBar = UITabBar()
        myTabBar.frame = CGRect(x:0, y:height-tabBarHeight, width: width, height:tabBarHeight)
        myTabBar.barTintColor = UIColor.lightGray
        myTabBar.unselectedItemTintColor = UIColor.white
        myTabBar.tintColor = UIColor.blue

        let home: UITabBarItem = UITabBarItem(title: "ホーム", image: UIImage(named: "Downloads"), tag:1)
        let settings: UITabBarItem = UITabBarItem(title: "設定", image: UIImage(named: "settings"), tag:2)
        
        myTabBar.items = [home,settings]
        myTabBar.delegate = self
        
        self.view.addSubview(myTabBar)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

