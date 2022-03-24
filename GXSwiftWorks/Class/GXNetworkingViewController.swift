//
//  GXNetworkingViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/3/22.
//

import UIKit

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
    }
    
    func createView() -> Void{
        self.view.addSubview(self.textView);
        self.textView.text = "哈哈";
    }
}
