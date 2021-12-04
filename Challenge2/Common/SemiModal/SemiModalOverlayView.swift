//
//  SemiModalOverlayView.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/12/01.
//

import UIKit

final class SemiModalOverlayView: UIView {
    
    var isActive: Bool = false {
        didSet {
            alpha = isActive ? 0.5 : 0.0
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SemiModalOverlayView {
    private func setup() {
        backgroundColor = UIColor.black
        alpha = 0.5
    }
}
