//
//  Bundle+Extension.swift
//  SwiftExtensions
//
//  Created by mac on 2017/2/6.
//  Copyright © 2017年 mac. All rights reserved.
//

import Foundation

extension Bundle {
    /// 获取命名空间
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }

}
