//
//  String+Extension.swift
//  SwiftExtensions
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 mac. All rights reserved.
//

import Foundation

extension String {
    
    /// 从当前字符串中，提取链接和文本
    func kfm_href() -> (link: String, text: String)? {
        
        //匹配方案
        let pattern = ""
        
        // 创建正则表达式,匹配第一项
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []),
        let result = regx.firstMatch(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            else {
                return nil
        }
        
        //获取结果
        let link = (self as NSString).substring(with: result.rangeAt(1))
        let text = (self as NSString).substring(with: result.rangeAt(2))
        
        return (link,text)
        
    }
    
    /// 从当前字符串中，提取链接和文本
    func kfm_hrefString() -> (NSTextCheckingResult)? {
        
        //匹配方案
        let pattern = ""
        
        // 创建正则表达式,匹配第一项
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []),
            let result = regx.firstMatch(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            else {
                return nil
        }
        
        return result
        
    }
}
