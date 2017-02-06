//
//  NetworkManager.swift
//  SwiftExtensions
//
//  Created by mac on 2017/2/6.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import AFNetworking

enum HTTPMethod {
    case GET
    case POST
}

class NetworkManager: AFHTTPSessionManager {
    
    static let shared = NetworkManager()
    
    func request(method: HTTPMethod = .GET, URLString: String, parmeters: [String:AnyObject]?, compeletion:@escaping (_ json: AnyObject?, _ ret: Bool)->()) {
        
        let success = { (task: URLSessionDataTask, json: Any?)->() in
            compeletion(json as AnyObject?,true)
        }
        
        let failure = { (task: URLSessionDataTask?, error: Error)->() in
            print("网络请求错误\(error)")
            compeletion(nil,false)
        }
        
        if method == .GET {
            get(URLString, parameters: parmeters, progress: nil, success: success, failure: failure)

        } else {
            post(URLString, parameters: parmeters, progress: nil, success: success, failure: failure)
        }
        
    }
    
}
