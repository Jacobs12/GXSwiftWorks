//
//  GXUtils.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/17.
//

import UIKit

class GXUtils: NSObject {
    
    /// 获取App版本号
    /// - Returns: App版本号
    class func appVersion() -> String{
        let key = "CFBundleShortVersionString";
        var version:String = "";
        let dict = Bundle.main.infoDictionary;
        version = dict?[key] as! String;
        return version;
    }
    
    /// 获取App的名称
    /// - Returns: App的名称
    class func bundleDisplayName() -> String{
        let key = "CFBundleDisplayName";
        var value:String = "";
        let dict = Bundle.main.infoDictionary;
        if(dict?[key] != nil){
            value = dict?[key] as! String;
        }
        return value;
    }
    
    /// 判断是否开启系统推送
    /// - Returns: 是否开启推送
    func isRemoteNotificationEnabled() -> Bool{
        var isEnabled = false;
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { result in
                switch result.authorizationStatus{
                case .authorized:
                    isEnabled = true;
                    break;
                case .denied:
                    isEnabled = false;
                    break;
                default:
                    isEnabled = false;
                    break;
                }
            }
        } else {
            // Fallback on earlier versions
            let isNotificationEnabled = UIApplication.shared.currentUserNotificationSettings?.types.contains(UIUserNotificationType.alert)
            if(isNotificationEnabled == true){
                isEnabled = true;
            }else{
                isEnabled = false;
            }
        };
        return isEnabled;
    }
}
