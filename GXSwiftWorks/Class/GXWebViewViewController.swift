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
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    
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
            }
            return _webView;
        }
    };

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
