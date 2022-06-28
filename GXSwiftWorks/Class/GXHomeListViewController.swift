//
//  GXHomeListViewController.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/6/28.
//

import UIKit

class GXHomeListViewController: GXBaseViewViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.createView();
    }
    
    func createView() ->Void{
        self.tableView.frame = CGRect.init(x: 0, y: GXDevice.navigationBarHeight(), width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - GXDevice.navigationBarHeight() - GXDevice.bottomSafeAreaHeight());
        self.view.addSubview(self.tableView);
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ID");
        if(cell == nil){
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "ID");
        }
        cell?.textLabel?.text = String(format: "%ld", indexPath.row + 1);
        return cell!;
    }

}
