//
//  ViewController.swift
//  SwiftExtensions
//
//  Created by mac on 2017/2/6.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

let SWidth = UIScreen.main.bounds.size.width

class ViewController: UIViewController {

    /// 自定义导航条
    lazy var navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: SWidth, height: 64))
    
    /// 自定义导航item
    lazy var navItem: UINavigationItem = UINavigationItem()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*自控制器会继承*/
    /// 设置设备方向支持
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    

    

}
extension ViewController {
    fileprivate func setupCustomNavBar() {
        title = "11"
        
        //关于navbar的返回融合
        // 1. 隐藏navbar
        navigationController?.navigationBar.isHidden = true
        // 添加导航条
        view.addSubview(navigationBar)
        // 将item设置给bar
        navigationBar.items = [navItem]
        // 设置navBar的渲染颜色
        navigationBar.barTintColor = UIColor.init(colorLiteralRed: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1.0)
        // 设置navBar的姿态颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        
    }

}
