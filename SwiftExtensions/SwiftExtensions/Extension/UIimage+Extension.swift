//
//  UIimage+Extension.swift
//  SwiftExtensions
//
//  Created by mac on 2017/2/6.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

extension UIImage {
    

    
    // 图片拉伸性能优化
    
    /// 将给定的图像进行拉伸，并且返回‘新’的图像
    ///
    /// - Returns: UIImage
    func avatarImage( size: CGSize?) -> UIImage? {
        
        var size = size
        
        if size == nil {
            size = self.size
        }
        
        let rect = CGRect(origin: CGPoint(), size: size!)
        //1. 图像上下文 - 内存中开辟一个地址，跟屏幕无关
        /**
         参数：
         1.size：绘图尺寸
         2.不透明：false／true
         3.scale：屏幕分辨率，如果不指定，默认生成的图像默认使用1.0的分辨率，图像质量不好
         可以给 0，会选择当前设备的病母分辨率
         */
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        // 2.绘图drawRect，在指定区域内拉伸屏幕
        draw(in: rect)
         //3. 取得结果
        let resule = UIGraphicsGetImageFromCurrentImageContext()
        //4.关闭上下文
        UIGraphicsEndImageContext()
        
        return resule
    }
    
    
    /// 圆形图片
    ///
    /// - Parameters:
    ///   - image: image
    ///   - size: 返回大小
    ///   - blackColor: 填充颜色
    /// - Returns: UIImage
    func ovalImage(size: CGSize?, blackColor: UIColor = UIColor.white) -> UIImage? {
        
        var size = size
        
        if size == nil {
            size = self.size
        }

        
        let rect = CGRect(origin: CGPoint(), size: size!)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        blackColor.setFill()
        UIRectFill(rect)
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
        
        draw(in: rect)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return result
        
    }
    
    
    /// 带边框的圆形图片
    ///
    /// - Parameters:
    ///   - image: image
    ///   - size: 返回大小
    ///   - blackColor: 填充颜色
    ///   - strokeColor: 边框颜色
    ///   - strokeLineWidth: 边框宽度
    /// - Returns: UIImage
    func ovalImage(size: CGSize?, blackColor: UIColor = UIColor.white,strokeColor: UIColor = UIColor.lightGray, strokeLineWidth: CGFloat = 2) -> UIImage? {
        
        var size = size
        
        if size == nil {
            size = self.size
        }
        
        let rect = CGRect(origin: CGPoint(), size: size!)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        blackColor.setFill()
        UIRectFill(rect)
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
        
        draw(in: rect)
        
        strokeColor.setStroke()
        path.lineWidth = strokeLineWidth
        path.stroke()
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return result
    }
}
