//
//  GXRefreshAnimationHeader.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/5/7.
//

import UIKit
import Lottie

class GXRefreshAnimationHeader: MJRefreshStateHeader {
//    设置存储RefreshHeader所有状态对应的动画图片
    var _stateImages:Dictionary<Int,Any>?;
    var stateImages:Dictionary<Int,Any>?{
        set{
            
        }
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
    
    /// 实例化tableView Header加载中动画，并实现懒加载模式
    var _gifView:AnimationView?;
    var gifView:AnimationView?{
        get{
            if(_gifView == nil){
                _gifView = AnimationView(name: "Header");
                _gifView?.contentMode = UIView.ContentMode.scaleAspectFit;
                _gifView?.center = CGPoint.init(x: UIScreen.main.bounds.size.width / 2.0, y: 32.0);
                _gifView?.loopMode = LottieLoopMode.loop;
            }
            return _gifView;
        }
    };
    
//    初始化刷新中动画图片数组、动画时间数组和刷新动画状态
    func set(_ images:Array<Any>, duration:TimeInterval, state:MJRefreshState) -> Void{
        if(images.isEmpty == true){
            return;
        }
//        let index:Int = state as! Int;
//        self.stateImages?[index] = images;
//        self.stateDurations?[index] = duration;
//        根据图片设置控件的高度
        let image:UIImage = images.first as! UIImage;
        if(image.size.height > self.mj_h){
            self.mj_h = image.size.height;
        }
    }
    
    func set(_ images:Array<Any>, state:MJRefreshState) -> Void{
        
    }
    
    /// 重写替换子视图方法placeSubviews
    override func placeSubviews() {
        super.placeSubviews();
        if(self.gifView?.constraints.count == 0){
            return;
        }
        self.gifView?.contentMode = UIView.ContentMode.center;
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
