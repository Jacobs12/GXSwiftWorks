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
    
    var dataTask:URLSessionDataTask?;
    
//    MARK: getters
//    func dataTask(with request:NSMutableURLRequest ,completionHandler:((URLResponse,Any,Error)->Void)) -> URLSessionDataTask{
//        var response:URLResponse;
//
//        let bridge:GXNetworkingBridge = GXNetworkingBridge.init()
    
//        var manager:AFHTTPSessionManager = bridge.manager();
//        let acceptableContentTypes:Set = ["text/html","text/plain"];
//        manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
//        manager.responseSerializer = bridge.responseSerializer();
//        let dataTask:URLSessionDataTask?;
    
//        return dataTask!;
//    }
    
    func dataTask(with url:String mode:GXRequestMode ,query:Dictionary<String, Any> ,headers:Dictionary<String, Any>,parameters:Dictionary<String, Any>,completionHandler:(@escaping (Data,URLResponse,Error)->Void)) -> URLSessionDataTask{
        var request
    }
    
    func dataTask(with request:URLRequest,completionHandler:(@escaping (Data,URLResponse,Error)->Void)) -> URLSessionDataTask{
        let session:URLSession? = URLSession.shared;
        self.dataTask = session?.dataTask(with: request, completionHandler: { responseData, response, error in
            completionHandler(responseData!,response!,error!);
        });
        self.dataTask?.resume();
        return self.dataTask!;
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
