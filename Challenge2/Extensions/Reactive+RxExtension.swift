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


// Kingfisher + Extension
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


// NSMutableAttributedString + Extension
extension Reactive where Base: UILabel {
    
    var attributedText: Binder<NSMutableAttributedString> {
        return Binder(base) { label, attrText in
            label.attributedText = attrText
        }
    }
}


//MARK: - Team Create Reactive + Extensions
enum TextFieldValidationResult {
    
    case ok(message: String)
    case empty
    case over(message: String)
    
    var textColor: UIColor {
        switch self {
        case .ok: return .black
        case .empty, .over: return .red
        }
    }
    
    var blindViewColor: UIColor {
        switch self {
        case .ok: return .clear
        case .empty, .over: return UIColor(red: 255/255, green: 0, blue: 0, alpha: 0.1)
        }
    }
}

extension TextFieldValidationResult: CustomStringConvertible {
    var description: String {
        switch self {
        case .ok(let message): return message
        case .empty: return "*入力してください"
        case .over(let message): return message
        }
    }
}

extension Reactive where Base: UILabel {
    var textFieldValidationResult: Binder<TextFieldValidationResult> {
        return Binder(base) { label, retult in
            label.text = retult.description
            label.textColor = retult.textColor
        }
    }
}

extension Reactive where Base: UIView {
    var textFieldValidationResult: Binder<TextFieldValidationResult> {
        return Binder(base) { view, retult in
            view.backgroundColor = retult.blindViewColor
        }
    }
}

extension Reactive where Base: TeamCreateDefaultCell {
    
    var switchDidTapped: ControlProperty<Bool> {
        return base.switchButton.rx.isOn
    }
    
}

extension Reactive where Base: SemiModalImageCollectionViewController {
    
    var doneTappedWithImage: Observable<BackImageResource> {
        let doneButton = base.doneButton.rx.tap.asObservable()
        let imageSelection = base.collectionView.rx.modelSelected(BackImageResource.self).asObservable()
        let pair = doneButton.withLatestFrom(imageSelection)
        return pair
    }
    
}

extension Reactive where Base: SemiModalPickerViewController {
    
    var doneTappedWithText: Observable<[String]> {
        let doneButton = base.doneButton.rx.tap.asObservable()
        let pickerSelection = base.pickerView.rx.modelSelected(String.self).asObservable()
        let pair = doneButton.withLatestFrom(pickerSelection)
        return pair
    }
    
}
