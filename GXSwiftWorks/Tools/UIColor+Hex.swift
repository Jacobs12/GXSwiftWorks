//
//  UIColor+Hex.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/4/13.
//

import UIKit

extension UIColor{
    class func color(withHex hex:Int64) -> UIColor{
        let red = ((CGFloat)((hex & 0xFF0000) >> 16))/255.0;
        let green = ((CGFloat)((hex & 0xFF00) >> 8))/255.0;
        let blue = ((CGFloat)(hex & 0xFF))/255.0;
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0);
        return color;
    }
}

