//
//  PlaceHolderTextView.swift
//  Challenge2TeamCreateDemo
//
//  Created by 石川大輔 on 2021/11/23.
//

import UIKit

public class PlaceHolderTextView: UITextView {
    
    lazy var placeHolderLabel: UILabel = UILabel()
    var placeHolderColor: UIColor = UIColor.lightGray
    var placeHolder: String = ""
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged(notification:)), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    override public func draw(_ rect: CGRect) {
        if(self.placeHolder.count > 0) {
            
            // to add line spacing
            let attributedString = NSMutableAttributedString(string: self.placeHolder)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
            self.placeHolderLabel.attributedText = attributedString
            
            self.placeHolderLabel.frame = CGRect(x: 8, y:8, width:self.bounds.size.width - 16,height: 0)
            self.placeHolderLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.placeHolderLabel.numberOfLines = 0
            self.placeHolderLabel.font = self.font
            self.placeHolderLabel.backgroundColor = UIColor.clear
            self.placeHolderLabel.textColor = self.placeHolderColor
            self.placeHolderLabel.alpha = 0
            self.placeHolderLabel.tag = 1
//            self.placeHolderLabel.text = self.placeHolder as String
            self.placeHolderLabel.sizeToFit()
            self.addSubview(placeHolderLabel)
        }
        
        self.sendSubviewToBack(placeHolderLabel)
        
        if(self.text.utf16.count == 0 && self.placeHolder.count > 0){
            self.viewWithTag(1)?.alpha = 1
        }
        
        super.draw(rect)
    }
    
    @objc public func textChanged(notification:NSNotification?) -> (Void) {
        if(self.placeHolder.count == 0){
            return
        }
        
        if(self.text.utf16.count == 0) {
            self.viewWithTag(1)?.alpha = 1
        }else{
            self.viewWithTag(1)?.alpha = 0
        }
    }
    
}
