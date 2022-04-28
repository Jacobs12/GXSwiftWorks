//
//  GXWebViewViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/4/20.
//

import UIKit
import WebKit

class GXScriptMessageHandlerDelegate : NSObject,WKNavigationDelegate,WKScriptMessageHandler,WKUIDelegate {
//    用于防止向JS中注入handler的时候强引用了self,最终导致内存泄漏 webView不销毁
    
    weak var scriptDelegate:WKScriptMessageHandler?;
    
    func set(delegate:WKScriptMessageHandler) -> Void{
        self.scriptDelegate = delegate;
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        self.scriptDelegate?.userContentController(userContentController, didReceive: message);
    }
}

class GXWebViewViewController: UIViewController,WKNavigationDelegate,WKScriptMessageHandler,WKUIDelegate {
    open var url:String?;
    open var filePath:String?;
    
    var _webView:WKWebView?;
    var config:WKWebViewConfiguration?;
    var webView:WKWebView?{
        get{
            if(_webView == nil){
                let config:WKWebViewConfiguration = WKWebViewConfiguration.init();
                config.allowsInlineMediaPlayback = true;
                self.config = config;
                let userContentController:WKUserContentController? = WKUserContentController();
                let nameArray:Array = ["AppConfirm","getUserInformation","getUserStatus","log","shareToPlatform"];
                for name:String in nameArray{
                    let handler:GXScriptMessageHandlerDelegate? = GXScriptMessageHandlerDelegate.init();
                    handler?.set(delegate: self);
                    userContentController?.add(handler!, name: name);
                }
                self.config?.userContentController = userContentController!;
                if #available(iOS 14.0, *) {
                    let webpagePreferences:WKWebpagePreferences = WKWebpagePreferences.init();
                    webpagePreferences.allowsContentJavaScript = true
                    config.defaultWebpagePreferences = webpagePreferences;
                } else {
                    // Fallback on earlier versions
                    config.preferences.javaScriptEnabled = true;
                };
                let y =  GXDevice.topSafeAreaHeight() + 64.0;
                _webView = WKWebView.init(frame: CGRect.init(x: 0, y:y, width: GXDevice.screenWidth(), height: GXDevice.screenHeight() - y), configuration: config);
                _webView?.uiDelegate = self;
                _webView?.navigationDelegate = self;
                _webView?.backgroundColor = UIColor.white;
                _webView?.allowsLinkPreview = false;
                _webView?.isOpaque = false;
                _webView?.clipsToBounds = true;
                _webView?.scrollView.showsVerticalScrollIndicator = false;
                _webView?.scrollView.showsHorizontalScrollIndicator = false;
                _webView?.contentMode = UIView.ContentMode.scaleAspectFill;
                _webView?.navigationDelegate = self;
                if #available(iOS 11.0, *) {
                    _webView?.scrollView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
                } else {
                    // Fallback on earlier versions
                    self.automaticallyAdjustsScrollViewInsets = false;
                };
            }
            return _webView;
        }
    };

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(self.webView!);
        self.loadRequest();
    }
    
    func loadRequest() -> Void{
        var url:URL?;
        if(self.url?.isEmpty == false){
            url = URL.init(string: self.url!);
        }else if(self.filePath?.isEmpty == false){
            url = URL.init(fileURLWithPath: self.filePath!);
        }
        if(url == nil){
            return;
        }
        let request:URLRequest? = URLRequest.init(url: url!);
        self.webView?.load(request!);
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
//    MARK: WKNavigationDelegate
//    当内容开始到达主帧时被调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
//    收到服务器重定向时调用
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
//    解决blank新起一个页面的冲突问题
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        如果是跳转一个新页面
        if(navigationAction.targetFrame == nil){
            webView.load(navigationAction.request);
        }
        if(navigationAction.targetFrame?.isMainFrame == false){
            webView.evaluateJavaScript("var a = document.getElementsByTagName('a');for(var i=0;i<a.length;i++){a[i].setAttribute('target','');}") { val, error in
                
            }
        }
        decisionHandler(WKNavigationActionPolicy.allow);
    }

//    MARK: WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if(message.name.isEqual(string: "AppConfirm")){
            let body:String = message.body as! String;
            print("web确认是否在App中打开页面:=== message.name:AppConfirm,message.body:" + body);
            self.appConfirmResponse();
        }else if(message.name.isEqual(string: "getUserInformation")){
            let body:String = message.body as! String;
            print("web拉取用户信息:=== message.name:getUserInformation,message.body:" + body);
        }else if(message.name.isEqual(string: "getUserStatus")){
            let body:String = message.body as! String;
            print("web拉取用户信息,不拉登录页" + body);
        }else if(message.name.isEqual(string: "log")){
            let body:String = message.body as! String;
            print("JS交互log:=== message.name:log,message.body:" + body);
        }else if(message.name.isEqual(string: "shareToPlatform")){
            let body:String = message.body as! String;
            print("分享到第三方社交平台:=== message.name:shareToPlatform,message.body:" + body);
        }
    }
    
//    MARK: Handler
    func appConfirmResponse() -> Void{
        let appVersion:String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String;
        let javaScript:String = "didOpenInApp('1','" + appVersion + "','" + UIDevice.current.identifierForVendor!.uuidString + "')";
        self.webView?.evaluateJavaScript(javaScript, completionHandler: { handler, error in
            
        });
    }
    
    func getUserInfo() -> Void{
        let userInfo = self.userInfo();
        let javaScript:String = "loginComplete('" + userInfo + "')";
        self.webView?.evaluateJavaScript(javaScript, completionHandler: { handler, error in
            
        });
    }
    
    func userInfo() -> String{
        let dict:Dictionary<String,Any> = ["uid":"1",
                               "userName":"灰太狼"
        ];
        let data:Data;
        do{
           data = try JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed);
        }catch{
            return "";
        }
        let userInfo:String = String.init(data: data, encoding: .utf8) ?? "";
        return userInfo;
    }
}
