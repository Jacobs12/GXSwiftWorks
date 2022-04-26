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
    
//    当内容开始到达主帧时被调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
//    收到服务器重定向时调用
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
}
