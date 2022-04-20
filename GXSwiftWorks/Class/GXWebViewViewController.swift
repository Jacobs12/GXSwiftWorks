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
    var webView:WKWebView?{
        get{
            if(_webView == nil){
                
            }
            return _webView;
        }
    };

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
