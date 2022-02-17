//
//  AppDelegate.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/2/9.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?;

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /**
         *Xcode 11版本后创建工程时，会默认添加了SceneDelegate类，主要为了适配iOS13系统后的暗黑模式，可以通过一下方法退会到原版本。
         
         * 删除SceneDelegate.h和SceneDelegate.m文件
         * 打开info.plist文件，删除 Application Scene Manifest 属性
         * 在 Appdelegate.h中添加 @property (nonatomic, strong) UIWindow *window;
         * 删除AppDelegate.m文件中 UISceneSession 相关代码
         * 初始化window
           self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
           self.window.backgroundColor = [UIColor whiteColor];
           self.window.rootViewController = [ViewController new];
           [self.window makeKeyAndVisible];*
         */
        self.window = UIWindow.init(frame: UIScreen.main.bounds);
        self.window?.backgroundColor = UIColor.white;
        self.window?.rootViewController = UINavigationController.init(rootViewController: ViewController.init());
        self.window?.makeKeyAndVisible();
        
        return true
    }

}

