//
//  GXRefreshAnimationFooter.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/5/7.
//

import UIKit
import Lottie
//import MJRefresh

class GXRefreshAnimationFooter: MJRefreshAutoNormalFooter {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var _gifView:AnimationView?;
    var gifView:AnimationView?{
//        创建AnimationFooter上拉加载动画视图
        get{
            if(_gifView == nil){
                let gifView:AnimationView? = AnimationView.init(name: "Footer");
                gifView?.contentMode = UIView.ContentMode.scaleAspectFit;
                gifView?.frame = CGRect.init(x: 0.0, y: 0.0, width: 36.0, height: 36.0);
                gifView?.center = CGPoint.init(x: UIScreen.main.bounds.size.width / 2.0, y: 22.0);
                gifView?.loopMode = LottieLoopMode.loop;
                self.addSubview(gifView!);
                _gifView = gifView;
            }
            return _gifView!;
        }
    };
    var _isDraging:Bool?; // 记录是否处于拖动状态
    
    var _stateImages:Dictionary<String,Any>?;
    var stateImages:Dictionary<String,Any>?{
        get{
            if(_stateImages == nil){
                _stateImages = [:];
            }
            return _stateImages;
        }
    }; // 记录所有状态对应的动画图片
    
    var _stateDurations:Dictionary<String,Any>?;
    var stateDurations:Dictionary<String,Any>?{
        get{
            if(_stateDurations == nil){
                _stateDurations = [:];
            }
            return _stateDurations;
        }
    }; // 记录所有状态对应的动画时间

    override func prepare() {
        super.prepare();
        _isDraging = false;
        self.stateLabel?.isHidden = true;
        self.loadingView?.isHidden = true;
        self.setTitle("数据加载完毕", for: .noMoreData);
    }
    
//    MARK: 公共方法
//    实现根据图片设置控件高度的方法
    public func set(_ images:Array<Any>,duration:TimeInterval,state:MJRefreshState) -> Void{
        
    }
    
    public func set(_ images:Array<Any>,state:MJRefreshState) -> Void{
        
    }
    
//    MARK: 实现父类的方法
    override var state: MJRefreshState{
        set{
//            检查刷新中动画当前的状态
            let oldState:MJRefreshState = super.state;
            if (newValue == oldState){
                return;
            }
            super.state = newValue;
//            根据刷新状态执行对应的方法
            if(state == MJRefreshState.pulling || state == MJRefreshState.refreshing){
                self.gifView?.isHidden = false;
                self.lotPlay();
            }else if(state == MJRefreshState.idle){
                self.stopAnimating();
            }else if(state == MJRefreshState.noMoreData){
                self.stateLabel?.isHidden = false;
                self.stopAnimating();
            }
        }
        get{
            return super.state;
        }
    };
    
    func lotPlay() -> Void{
        self.loadingView?.isHidden = true;
        if(self.gifView?.isAnimationPlaying == true){
            
        }else{
            self.gifView?.play(completion: { isAnimationFinished in
                
            });
        }
    };
    
    func stopAnimating() -> Void{
        if(self.gifView?.isAnimationPlaying == true){
            self.gifView?.stop();
        }
    };
    
    override func resetNoMoreData() {
        _isDraging = false;
        super.resetNoMoreData();
    }
    
    /// 实现scrollView的拖拽状态发生改变的时候的调用方法
    /// - Parameter change: change description
    override func scrollViewPanStateDidChange(_ change: [AnyHashable : Any]?) {
        super.scrollViewPanStateDidChange(change);
        _isDraging = true;
    }
    
    override func scrollViewContentOffsetDidChange(_ change: [AnyHashable : Any]?) {
        super.scrollViewContentOffsetDidChange(change);
        let scrollView:UIScrollView! = self.scrollView;
        if(scrollView.contentSize.height < 44.0 || _isDraging == false){
            return;
        }
        let d_y:CGFloat = (scrollView.bounds.size.height + scrollView.contentOffset.y) - scrollView.contentSize.height;
        if(d_y > 0){
            if(self.state == MJRefreshState.idle){
                self.state = MJRefreshState.refreshing;
            }
        }
    }
    
}
