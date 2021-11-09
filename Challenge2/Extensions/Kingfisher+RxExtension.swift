//
//  Kingfisher+Rx.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

extension Reactive where Base: UIImageView {
    
    public var imageURL: Binder<URL?> {
        return self.imageURL(withPlaceholder: nil)
    }
    
    public func imageURL(withPlaceholder placeholderImage: UIImage?, options: KingfisherOptionsInfo? = []) -> Binder<URL?> {
        
        return Binder(self.base, binding: { (imageView, url) in
            imageView.kf.setImage(with: url, placeholder: placeholderImage, options: options, completionHandler: { (result) in})
        })
    }
    
}
