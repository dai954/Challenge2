//
//  String+Extension.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/11.
//

import UIKit

extension String {
    
    var challengeDateString: String {
        let isoFormatter = DateFormatter()
        isoFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssX"
        isoFormatter.locale = Locale(identifier: "en_US_POSIX")
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let date = isoFormatter.date(from: self)!
        let formatter = DateFormatter()
        formatter.dateFormat = "MM月dd日 hh:mm"
        return formatter.string(from: date)
    }
    
    func lineSpaceAttributedString(space: CGFloat) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        return attributedString
    }
    
}
