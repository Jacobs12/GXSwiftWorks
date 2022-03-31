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
    
    func dataTask(host:String,mode:GXRequestMode,query:Dictionary<String, Any>?,headers:Dictionary<String, Any>?,parameters:Dictionary<String, Any>?,completionHandler:(@escaping (Data?,URLResponse?,Error?)->Void)) -> URLSessionDataTask?{
        if(host.isEmpty){
            return nil;
        }
        var hostString:String? = host;
//        拼接query参数
        if(query?.isEmpty == false){
            var surfixString:String? = "&";
            if(hostString?.contains("?") == false){
                surfixString = "?";
            }
            var resultHost:String? = String(format: "%@%@", hostString!,surfixString!);
            var index = 0;
            for (key,value) in query!{
                if(index != 0){
                    resultHost?.append("&");
                }
                let object = String(format: "%@=%@", key ,value as! String);
                resultHost?.append(object);
                index = index + 1;
            }
            hostString = resultHost;
        }
        hostString = hostString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed);
        let url:URL? = URL(string: hostString!);
        var request:URLRequest? = URLRequest(url: url!);
        request?.httpMethod = self.string(mode: mode);
//        设置header
        if(headers?.isEmpty == false){
            for (key,value) in headers!{
                request?.addValue(value as! String, forHTTPHeaderField: key);
            }
        }
//        设置body
        if(parameters?.isEmpty == false){
            var body:String = "";
            var index = 0;
            for (key,value) in parameters!{
                if(index != 0){
                    body.append("&");
                }
                let object = String(format: "%@=%@", key,value as! String);
                body.append(object);
                index = index + 1;
            }
            let data = body.data(using: .utf8);
            request?.httpBody = data;
        }
        let dataTask:URLSessionDataTask? = self.dataTask(request: request!) { responseData, response, error in
            completionHandler(responseData,response,error);
        };
        return dataTask!;
    }
    
    func dataTask(request:URLRequest,completionHandler:(@escaping (Data?,URLResponse?,Error?)->Void)) -> URLSessionDataTask?{
        let session:URLSession? = URLSession.shared;
        self.dataTask = session?.dataTask(with: request, completionHandler: { responseData, response, error in
            completionHandler(responseData,response,error);
        });
        self.dataTask?.resume();
        return self.dataTask!;
    }
    
    func string(mode:GXRequestMode) -> String{
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
    
//    MARK: request
    
    /// 发起GET请求
    /// - Parameters:
    ///   - host: 主机地址
    ///   - query: query参数
    ///   - headers: headers
    ///   - parameters: body
    ///   - completionHandler: 请求完成回调
    /// - Returns: 请求任务实例
    func get(host:String,query:Dictionary<String, Any>?,headers:Dictionary<String, Any>?,completionHandler:(@escaping (Data?,URLResponse?,Error?)->Void)) -> URLSessionDataTask?{
        let parameters:Dictionary<String,Any>? = [:];
        let dataTask:URLSessionDataTask? = self.dataTask(host: host, mode: .Get, query: query, headers: headers, parameters: parameters) { responseData, response, error in
            completionHandler(responseData,response,error);
        }
        return dataTask!;
    }
    
    func post(host:String,query:Dictionary<String, Any>?,headers:Dictionary<String, Any>?,parameters:Dictionary<String, Any>?,completionHandler:(@escaping (Data?,URLResponse?,Error?)->Void)) -> URLSessionDataTask?{
        let dataTask:URLSessionDataTask? = self.dataTask(host: host, mode: .Post, query: query, headers: headers, parameters: parameters) { responseData, response, error in
            completionHandler(responseData,response,error);
        }
        return dataTask!;
    }
}
