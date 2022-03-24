//
//  ViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/9.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate,GXProtocolDelegate{
    
//   MARK: property
    private var _dataArray:NSMutableArray?;
    var dataArray:NSMutableArray?{
        get{
            if(_dataArray == nil){
                _dataArray = NSMutableArray.init();
                let array = [
                    "闭包","setter和getter","单例数值每次+1，Log输出","类方法","delegate","AFNetworking"
                ];
                _dataArray?.addObjects(from: array);
            }
            return _dataArray;
        }
    };
    
    private var _tableView:UITableView?;
    private var tableView:UITableView?{
        if(_tableView == nil){
            _tableView = UITableView.init(frame: CGRect.init(x: 0.0, y: 64.0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain);
            _tableView?.dataSource = self;
            _tableView?.delegate = self;
        }
        return _tableView;
    };
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.tableView!);
//        self.navigationController?.isNavigationBarHidden = true;
    }

    // MARK: tableView delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let row:Int = self.dataArray!.count ;
        return row;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ID");
        if(cell == nil){
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "ID");
            cell?.selectionStyle = UITableViewCell.SelectionStyle.none;
        }
        let str:String? = self.dataArray!.object(at: indexPath.row) as? String;
        cell?.textLabel?.text = str;
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc:GXBlockViewController? = GXBlockViewController.init();
//            闭包的使用
            vc?.callBack = { str1,str2 in
                NSLog("闭包回调传值:%@ %@", str1,str2);
            }
            self.navigationController?.pushViewController(vc!, animated: true);
            break;
        case 1:
            let vc:GXSetterViewController? = GXSetterViewController.init();
            self.navigationController?.pushViewController(vc!, animated: true);
            break;
        case 2:
            let dog:GXSingleCaseManager? = GXSingleCaseManager.defaultManager();
            dog!.add(1, options: [:], completion: { str1, str2 in
                
            });
            break;
        case 3:
            let vc:GXClassFunctionViewController? = GXClassFunctionViewController.init();
            self.navigationController?.pushViewController(vc!, animated: true);
            break;
        case 4:
            let vc:GXProtocolViewController? = GXProtocolViewController.init();
            vc?.delegate = self;
            self.navigationController?.pushViewController(vc!, animated: true);
            break;
        case 5:
            let vc:GXNetworkingViewController = GXNetworkingViewController.init();
            self.navigationController?.pushViewController(vc, animated: true);
            break;
        default:
           
            break;
        }
    }
    
    func callBack(value1: String, value2: String) {
        NSLog("%@  %@", value1,value2);
    }
}

