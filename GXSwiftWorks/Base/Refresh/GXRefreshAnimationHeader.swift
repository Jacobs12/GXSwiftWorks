//
//  GXRefreshAnimationHeader.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/5/7.
//

import UIKit

class GXRefreshAnimationHeader: MJRefreshStateHeader {
//    设置存储RefreshHeader所有状态对应的动画图片
    var _stateImages:Dictionary<String,Any>?;
    var stateImages:Dictionary<String,Any>?{
        get{
            if(_stateImages?.isEmpty == true){
                _stateImages = [:];
            }
            return _stateImages;
        }
    };
//    设置记录RefreshHeader所有状态对应的动画时间
    var _stateDurations:Dictionary<String,Any>?;
    var stateDurations:Dictionary<String,Any>?{
        get{
            if(_stateDurations?.isEmpty == true){
                _stateDurations = [:];
            }
            return _stateDurations;
        }
    };
    
//    var _gifView:lot

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
