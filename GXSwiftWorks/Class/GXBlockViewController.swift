//
//  GXBlockViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/9.
//

import UIKit

class GXBlockViewController: UIViewController {
    
//    声明闭包属性
    var callBack:((String,String) -> Void)?;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange;
        self.start(duration: 3) { str1, str2 in
            NSLog("%@ %@", str1,str2);
        };
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func start(duration:Int, completion:@escaping((NSString,NSString) -> Void)) -> Void{
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            completion("800","900");
        });
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(self.callBack != nil){
            self.callBack!("200","300");
        }
    }
}
