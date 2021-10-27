//
//  UIColor.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

enum ColorTheme: Int {
    
case red, white, gray
    var color: UIColor {
        switch self {
        case .red:
            return #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        case .white:
            return .white
        case .gray:
            return #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1)
        }
    }
    
}

extension UIColor {
    static func primaryRed() -> UIColor {
        return ColorTheme.red.color
    }
    
    static func primaryWhite() -> UIColor {
        return ColorTheme.white.color
    }
    
    static func primaryGray() -> UIColor {
        return ColorTheme.gray.color
    }
}
