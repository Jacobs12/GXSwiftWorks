//
//  GXSingleCaseManager.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/17.
//

import UIKit

class GXSingleCaseManager: NSObject {
    
    static var manager:GXSingleCaseManager? = nil;
    
    var number:Int = 1;
    
    class func defaultManager() -> GXSingleCaseManager{
        if(manager == nil){
            manager = GXSingleCaseManager.init();
        }
        return manager!;
    }
    
    func add(_ number:Int ,options ext:Any,completion completionHandler:@escaping((NSString,NSString) -> Void)) -> Void{
        self.number = self.number + 1;
        NSLog("%d", self.number);
        completionHandler("","");
    };
}
