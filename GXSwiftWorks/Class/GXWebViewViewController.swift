//
//  GXWebViewViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/4/20.
//

import UIKit
import WebKit

class GXWebViewViewController: UIViewController {
    
    var _webView:WKWebView?;
    var config:WKWebViewConfiguration?;
    var webView:WKWebView?{
        get{
            if(_webView == nil){
                let config:WKWebViewConfiguration = WKWebViewConfiguration.init();
                config.allowsInlineMediaPlayback = true;
                self.config = config;
                config.userContentController = WKUserContentController.init();
//                self.config?.userContentController.addScriptMessageHandler(<#T##scriptMessageHandlerWithReply: WKScriptMessageHandlerWithReply##WKScriptMessageHandlerWithReply#>, contentWorld: .defaultClient, name: <#T##String#>)
            }
            return _webView;
        }
    };

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
