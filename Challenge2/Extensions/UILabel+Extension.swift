//
//  UILabel+Extention.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/07.
//

import UIKit

extension UILabel {
    
    func lastLetterToSmall(value: String) {

        let changePosition = value.count - 1
        
        let attrText = NSMutableAttributedString(string: self.text!)
        attrText.addAttributes([
                .font: UIFont.systemFont(ofSize: 12)
            ], range: NSMakeRange(changePosition, 1))
        self.attributedText = attrText
    }
    
}

