//
//  GXProtocolViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/3/22.
//

import UIKit

protocol GXProtocolDelegate:NSObjectProtocol{
    func callBack(value1:String , value2:String);
}

class GXProtocolViewController: UIViewController {
    
    weak var delegate:GXProtocolDelegate?
    
    var _button:UIButton?;
    var button:UIButton{
        get{
            if(_button == nil){
                _button = UIButton(type: .roundedRect);
                _button?.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.size.height / 2.0, width: 100.0, height: 50.0);
                _button?.center = CGPoint.init(x: UIScreen.main.bounds.size.width / 2.0, y: _button?.center.y ?? 0);
                _button?.setTitle("点击代理回调", for: .normal);
                _button?.addTarget(self, action:#selector(buttonClick(_:)), for: .touchUpInside);
            }
            return _button!;
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white;
        self.view.addSubview(self.button)
    }
    
//    @objc 可以给objective使用的类方法
    @objc func buttonClick(_ sender:Any) ->Void{
        if(self.delegate != nil){
            self.delegate?.callBack(value1: "1", value2: "2");
        }
    }
}
