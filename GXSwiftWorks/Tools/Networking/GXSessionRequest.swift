//
//  GXSessionRequest.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/17.
//

import UIKit

enum GXRequestMode{
    case Get
    case Post
    case Put
    case Delete
    case Others
};

class GXSessionRequest: NSObject {
    
//    MARK: getters
    func dataTask(with request:NSMutableURLRequest ,completionHandler:((URLResponse,Any,Error)->Void)) -> URLSessionDataTask{
        var response:URLResponse;
        
        let bridge:GXNetworkingBridge = GXNetworkingBridge.init()
        var manager:AFHTTPSessionManager = bridge.manager();
        let acceptableContentTypes:Set = ["text/html","text/plain"];
        manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
        manager.responseSerializer = AFHTTPResponseSerializer
        let dataTask:URLSessionDataTask?;
        return dataTask!;
    }
    
    func string(withRequest mode:GXRequestMode) -> String{
        var result:String? = "GET";
        switch mode{
        case .Get:
            result = "GET";
            break;
        case .Post:
            result = "POST";
            break;
        case .Put:
            result = "PUT";
            break;
        case .Delete:
            result = "DELETE";
            break;
        default:
            break;
        }
        return result!;
    }
}
