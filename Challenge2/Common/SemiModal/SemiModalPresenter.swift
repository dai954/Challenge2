//
//  SemiModalPresenter.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/12/01.
//

import UIKit

protocol  SemiModalPresenterDelegate: AnyObject {
    var semiModalContentHeight: CGFloat { get }
}

final class SemiModalPresenter: NSObject {
    
    weak var viewController: UIViewController? {
        didSet {
            if let viewController = viewController {
                viewController.modalPresentationStyle = .custom
                viewController.transitioningDelegate = self
            }
        }
    }
    
    lazy var overlayView: SemiModalOverlayView = {
        let overlayView = SemiModalOverlayView()
        overlayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(overlayDidTap(_:))))
        return overlayView
    }()
    
    @objc private func overlayDidTap(_ sender: NSObject) {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
}

extension SemiModalPresenter: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SemiModalPresentarionController(presentedViewController: presented,
                                               presenting: presenting,
                                               overlayView: overlayView)
    }
    
    
    
}
