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
    
    
    @IBOutlet weak var tableView: UITableView!

    lazy var refreshControl = UIRefreshControl()
    
    /// 自定义导航条
    lazy var navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: SWidth, height: 64))
    
    /// 自定义导航item
    lazy var navItem: UINavigationItem = UINavigationItem()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //离屏渲染
        self.view.layer.drawsAsynchronously = true
        //栅格化 - 异步绘制后，会生成一张独立的图像,cell在屏幕上滚动的时候，本质滚动这张图片
        //cell 优化，要尽量减少涂层的数量，相当于就只有一层！
        //停止滚动后，可以接受坚挺
        self.view.layer.shouldRasterize = true
        // 使用 栅格化 必须注意指定分辨率
        self.view.layer.rasterizationScale = UIScreen.main.scale
        
        tableView.addSubview(refreshControl)
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

