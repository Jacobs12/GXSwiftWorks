//
//  String+Extension.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/4/13.
//

import Foundation

extension String{
    
    /// 计算文本的长度
    /// - Returns: 文本的长度
    func length() -> Int{
        let length = self.count;
        return length;
    }
    
    /// 根据最大宽度和字体大小计算文本的高度
    /// - Parameters:
    ///   - width: 文本最大宽度
    ///   - font: 文本字体大小
    /// - Returns: 文本的高度
    func height(with width:CGFloat, font:UIFont) -> CGFloat{
        let size = self.boundingRect(with: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesFontLeading, attributes: [.font:font], context: nil).size;
        let height:CGFloat = size.height;
        return height;
    }
}
