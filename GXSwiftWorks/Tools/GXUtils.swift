//
//  GXUtils.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/17.
//

import UIKit

class GXUtils: NSObject {
    
    class func appVersion() -> String{
        let key = "CFBundleShortVersionString";
        var version:String = "";
        let dict = Bundle.main.infoDictionary;
        version = dict?[key] as! String;
        return version;
    }
    
    class func bundleDisplayName() -> String{
        let key = "CFBundleDisplayName";
        var value:String = "";
        let dict = Bundle.main.infoDictionary;
        if(dict?[key] != nil){
            value = dict?[key] as! String;
        }
        return value;
    }
}
