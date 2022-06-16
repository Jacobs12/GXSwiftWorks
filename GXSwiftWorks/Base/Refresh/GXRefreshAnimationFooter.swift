//
//  GXRefreshAnimationFooter.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/5/7.
//

import UIKit
import Lottie

class GXRefreshAnimationFooter: MJRefreshAutoNormalFooter {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var _gifView:AnimationView?;
    var gifView:AnimationView?;
    var _isDraging:Bool?; // 记录是否处于拖动状态
    
    var _stateImages:Dictionary<String,Any>?;
    var stateImages:Dictionary<String,Any>?; // 记录所有状态对应的动画图片
    
    var _stateDurations:Dictionary<String,Any>?;
    var stateDurations:Dictionary<String,Any>?; // 记录所有状态对应的动画时间

}
