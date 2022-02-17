//
//  GXDevice.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/17.
//

import UIKit

class GXDevice: NSObject {
    
    class func mainWindow() -> UIWindow{
        let window:UIWindow? = (UIApplication.shared.delegate?.window)!;
        return window!;
    }
    
    class func isHaveSafeArea() -> Bool{
        var result = false;
        let window:UIWindow? = GXDevice.mainWindow();
        let bottom = (window?.safeAreaInsets.bottom)!;
        if(bottom > 0.1){
            result = true;
        }
        return result;
    }

    class func isPhoneX() -> Bool{
        let result = GXDevice.isHaveSafeArea();
        return result;
    }
    
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
