//
//  GXBaseViewViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/5/7.
//

import UIKit

class GXBaseViewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var _tableView:UITableView?;
    var tableView:UITableView{
        get{
            if(_tableView == nil){
                _tableView = UITableView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: self.view.bounds.size.height), style: .plain);
                _tableView?.dataSource = self;
                _tableView?.delegate = self;
                _tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none;
                if #available(iOS 11.0, *) {
                    _tableView?.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
                } else {
                    // Fallback on earlier versions
                };
                _tableView?.showsVerticalScrollIndicator = false;
            }
            return _tableView!;
        }
    };
    
    var _refreshHeader:GXRefreshAnimationHeader?;
    var refreshHeader:GXRefreshAnimationHeader?{
        get{
            if(_refreshHeader == nil){
                _refreshHeader = GXRefreshAnimationHeader(refreshingBlock: {
                    
                });
            }
            return _refreshHeader;
        }
    };

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white;
    }
    

//    MARK: tableView delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ID");
        if(cell == nil){
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "ID");
            cell?.selectionStyle = UITableViewCell.SelectionStyle.none;
        }
        return cell!;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
