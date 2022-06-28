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
    
    /// 获取屏幕宽度
    class func screenWidth() -> CGFloat{
        let width = UIScreen.main.bounds.size.width;
        let height = UIScreen.main.bounds.size.height;
        let result = min(width, height);
        return result;
    }
    
    /// 获取屏幕高度
    class func screenHeight() -> CGFloat{
        let width = UIScreen.main.bounds.size.width;
        let height = UIScreen.main.bounds.size.height;
        let result = max(width, height);
        return result;
    }
    
    /// 屏幕大小比例（相对于375）
    class func screenScale() -> CGFloat{
        let width = GXDevice.screenWidth();
        let result = width / 375.0;
        return result;
    }
    
//    MARK: 顶部区域
    
    /// 顶部安全区域高度
    class func topSafeAreaHeight() -> CGFloat{
        var height = 0.0;
        if(GXDevice.isHaveSafeArea() == true){
            height = 24.0;
        }
        return height;
    }
    
    /// 状态栏高度
    class func stautsBarHeight() -> CGFloat{
        var height = 20.0;
        if(GXDevice.isHaveSafeArea() == true){
            height = 44.0;
        }
        return height;
    }
    
//    MARK: 底部区域
    
    /// 实现获取底部安全区域高度代码
    class func bottomSafeAreaHeight() -> CGFloat{
        var height:CGFloat = 0.0;
        if(GXDevice.isHaveSafeArea() == true){
            height = 34.0;
        }
        return height;
    }
    
    /// 实现获取底部tabbar高度计算方法的代码
    class func tabbarHeight() -> CGFloat{
        let height = 49.0 + GXDevice.bottomSafeAreaHeight();
        return height;
    }
}
