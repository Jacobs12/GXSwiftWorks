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
        self.tableView.frame = CGRect.init(x: 0, y: GXDevice.stautsBarHeight()+44.0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - GXDevice.stautsBarHeight() - GXDevice.)
    }

}
