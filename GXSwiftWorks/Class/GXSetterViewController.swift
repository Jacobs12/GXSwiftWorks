//
//  GXSetterViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/10.
//

import UIKit

class GXSetterViewController: UIViewController {

    var _name:String?;
    var name:String?{
        set{
            _name = newValue;
            self.label?.text = String(format: "%@", _name!);
        }
        get{
            return _name;
        }
    };
    
    var _label:UILabel?;
    var label:UILabel?{
        get{
            if(_label == nil){
                _label = UILabel.init(frame: CGRect.init(x: 0.0, y: 200.0, width: 100.0, height: 100.0));
                let x:CGFloat = UIScreen.main.bounds.size.width / 2.0;
                let y:CGFloat = _label?.center.y ?? 0.0;
                _label?.center = CGPoint.init(x: x, y: y);
                _label?.text = "赋值前";
            }
            return _label;
        }
    };
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange;
        self.view.addSubview(self.label!);
        
        

        
        
        
        
        let value = GXUtils.appVersion();
        print(value);
        
        let result = GXUtils.bundleDisplayName();
        print(result);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func update(String string:String) -> Void{
        let string:String? = String(format: "%@", string);
        self.name = string;
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.update(String: "赋值后");
    }
}
