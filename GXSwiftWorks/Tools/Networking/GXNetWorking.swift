//
//  GXNetWorking.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/17.
//

import UIKit

class GXNetWorking: NSObject {
    
//    MARK: GET请求
    class func get(host:String,query:Dictionary<String, Any>?,headers:Dictionary<String, Any>?,completionHandler:(@escaping (Data?,URLResponse?,Error?)->Void)) -> URLSessionDataTask?{
        let session:GXSessionRequest? = GXSessionRequest.init();
        let dataTask:URLSessionDataTask? = session?.get(host: host, query: query, headers: headers, completionHandler: { responseData, response, error in
            completionHandler(responseData,response,error);
        })
        return dataTask!;
    }
    
//    MARK: - POST请求
    class func post(host:String,query:Dictionary<String, Any>?,headers:Dictionary<String, Any>?,parameters:Dictionary<String, Any>?,completionHandler:(@escaping (Data?,URLResponse?,Error?)->Void)) -> URLSessionDataTask?{
        let session:GXSessionRequest? = GXSessionRequest.init();
        let dataTask:URLSessionDataTask? = session?.post(host: host, query: query, headers: headers, parameters: parameters, completionHandler: { responseData, response, error in
            completionHandler(responseData,response,error);
        });
        return dataTask!;
    }
}
