//
//  GXNetworkingViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/3/22.
//

import UIKit

class GXNetworkingModel:NSObject{
//    KVC赋值时必须添加 @objc
    @objc var subLemmaId:Any?;
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}

class GXNetworkingViewController: UIViewController {
    
    var _textView:UITextView?;
    
    var textView:UITextView{
        get{
            if(_textView == nil){
                let x = 0.0;
                let y = GXDevice.stautsBarHeight() + 44.0;
                let width = UIScreen.main.bounds.size.width;
                let height = UIScreen.main.bounds.size.height - y;
                _textView = UITextView.init(frame: CGRect.init(x: x, y: y, width: width, height: height));
                _textView?.isEditable = false;
            }
            return _textView!;
        }
    };

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createView();
        let host = "http://baike.baidu.com/api/openapi/BaikeLemmaCardApi?scope=103&format=json&appid=379020&bk_key=关键字&bk_length=600";
        let query:Dictionary<String,Any>? = ["kk":"vvv"];
        let headers:Dictionary<String,Any>? = ["aaa":"bbb"];
        let parameters:Dictionary<String,Any>? = ["ppp":"qqq"];
//        GXNetWorking.get(host: host, query: query, headers: headers) { data, response, error in
//            let string:String? = String.init(data: data!, encoding: .utf8);
//            print(string as Any);
//        };
        
        
        GXNetWorking.post(host: host, query: query, headers: headers, parameters: parameters) { data, response, error in
                let jsonString:String? = String.init(data: data!, encoding: .utf8);
    //            print(string as Any);
//                let dict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! AnyObject;
    //            NSLog("%@", dict);
//            let jsonData = jsonString?.data(using: .utf8);
//            let dict = try JSONSerialization.jsonObject(with: jsonData!, options: .mutableContainers);
            if(error == nil){
                self.requestFinished(responseData: data!, response: response!);
            }else{
                
            }
            DispatchQueue.main.async {
                self.textView.text = jsonString;
            };
        };
    }
    
    func requestFinished(responseData:Data,response:URLResponse) -> Void{
        do{
            let dict:Dictionary<String,Any> = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as! Dictionary<String, Any>;
            let model:GXNetworkingModel? = GXNetworkingModel.init();
            model?.setValuesForKeys(dict);
            print(dict);
        }catch{
            
        }
    }
    
    func createView() -> Void{
        self.view.addSubview(self.textView);
        self.textView.text = "哈哈";
    }
}
