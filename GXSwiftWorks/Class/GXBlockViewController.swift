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
        self.start();
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func start() -> Void{
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            if((self.callBack) != nil){
                self.callBack!("100","200");
            }
        });
    }
}
