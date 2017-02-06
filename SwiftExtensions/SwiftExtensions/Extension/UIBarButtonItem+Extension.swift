//
//  UIBarButtonItem+Extension.swift
//  SwiftExtensions
//
//  Created by mac on 2017/2/6.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    
    
    /// 创建 UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: fontSize，默认16
    ///   - normalColor: normalColor
    ///   - highlightedColor: highlightedColor
    ///   - target: target
    ///   - action: action
    convenience init(title: String, fontSize: CGFloat = 16, normalColor: UIColor, highlightedColor: UIColor, target: AnyObject?, action: Selector) {
        let btn: UIButton = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        btn.setTitleColor(normalColor, for: .normal)
        btn.setTitleColor(highlightedColor, for: .highlighted)
        
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        // 实例化 UIBarButtonItem
        self.init(customView:btn)
    }
    
    
    /// 创建 返回UIBarButtonItem
    ///
    /// - Parameters:
    ///   - backTitle: backTitle
    ///   - fontSize: fontSize，默认16
    ///   - normalColor: normalColor
    ///   - highlightedColor: highlightedColor
    ///   - target: target
    ///   - action: action
    ///   - imageName: 图片
    convenience init(backTitle: String, fontSize: CGFloat = 16, normalColor: UIColor, highlightedColor: UIColor, target: AnyObject?, action: Selector, imageName: String = "", highlightedImageName: String = "") {
        let btn: UIButton = UIButton(type: .custom)
        btn.setTitle(backTitle, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        btn.setTitleColor(normalColor, for: .normal)
        btn.setTitleColor(highlightedColor, for: .highlighted)
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highlightedImageName), for: .normal)
        
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        // 实例化 UIBarButtonItem
        self.init(customView:btn)
    }
}
