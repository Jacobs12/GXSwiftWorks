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
    
    var _button:UIButton?;
    var button:UIButton{
        get{
            if(_button == nil){
                _button = UIButton(type: .roundedRect);
            }
            return _button!;
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
