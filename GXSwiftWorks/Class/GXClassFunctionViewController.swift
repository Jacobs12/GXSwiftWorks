//
//  GXClassFunctionViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/3/22.
//

import UIKit

class GXClassFunctionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GXClassFunctionViewController.classFunction("");
    }
    
    class func classFunction(_ value:String) -> Void{
        NSLog("迪迦奥特曼");
//        let url:URL? = URL(string: "");
//        let a:Array = ["","1"];
//        if #available(iOS 10.0, *) {
//            do{
////                UIApplication.shared.open(url!, options: [:]) { result in
////
////                };
//                let c = try? a[1];
//                NSLog("输出\(c)");
//            }catch{
//                return;
//            }
//        } else {
//            // Fallback on earlier versions
//        }
    }
}
