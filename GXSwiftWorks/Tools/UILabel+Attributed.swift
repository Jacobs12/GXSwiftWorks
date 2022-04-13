//
//  UILabel+Attributed.swift
//  GXSwiftWorks
//
//  Created by wolffy on 2022/4/13.
//

import Foundation

extension UILabel{
    func set(text:String ,line spacing:CGFloat) ->Void{
        var paragraph:NSMutableParagraphStyle = NSMutableParagraphStyle.init();
        paragraph.lineSpacing = spacing;
        let string:String = self.text ?? "";
        let attributedString:NSMutableAttributedString = NSMutableAttributedString.init(string:string);
        attributedString.addAttributes([.paragraphStyle:paragraph], range: NSMakeRange(0, string.count));
    }
}
