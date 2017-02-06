//
//  UIImageView+WebImage.swift
//  SwiftExtensions
//
//  Created by mac on 2017/2/6.
//  Copyright © 2017年 mac. All rights reserved.
//

import SDWebImage

extension UIImageView {
    
    
    
    /// 隔离 SDWebImage 设置图像函数
    ///
    /// - Parameters:
    ///   - urlString: urlString
    ///   - placeholderImage: 占位图像
    func kfm_setImage(urlString: String?, placeholderImage: UIImage?, isAvatar: Bool = false) {
        
        //处理URL
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
            
            //设置占位图像
            image = placeholderImage
            
            return
        }
        
        sd_setImage(with: url, placeholderImage: placeholderImage, options: [], progress: nil) { [weak self] (image, _, _, _) in
            
            //完成回调 - 判断是否是头像
            if isAvatar {
                self?.image =  image?.ovalImage(size: self?.bounds.size)
            }
        }
        
    }
}
