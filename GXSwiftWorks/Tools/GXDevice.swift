//
//  GXDevice.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/17.
//

import UIKit

class GXDevice: NSObject {
    
//    MARK: window
    
    class func mainWindow() -> UIWindow{
        let window:UIWindow? = (UIApplication.shared.delegate?.window)!;
        return window!;
    }
    
//    MARK: 机型判断
    
    class func isHaveSafeArea() -> Bool{
        var result = false;
        let window:UIWindow? = GXDevice.mainWindow();
        if #available(iOS 11.0, *) {
            let bottom = (window?.safeAreaInsets.bottom)!
            if(bottom > 0.1){
                result = true;
            }
        } else {
            // Fallback on earlier versions
        };
        return result;
    }

    class func isPhoneX() -> Bool{
        let result = GXDevice.isHaveSafeArea();
        return result;
    }
    
//    MARK: 屏幕宽高
    
    class func screenHeight() -> CGFloat{
        let width = UIScreen.main.bounds.size.width;
        let height = UIScreen.main.bounds.size.height;
        let result = max(width, height);
        return result;
    }
    
    class func screenWidth() -> CGFloat{
        let width = UIScreen.main.bounds.size.width;
        let height = UIScreen.main.bounds.size.height;
        let result = min(width, height);
        return result;
    }
    
    class func screenScale() -> CGFloat{
        let width = GXDevice.screenWidth();
        let result = width / 375.0;
        return result;
    }
}
