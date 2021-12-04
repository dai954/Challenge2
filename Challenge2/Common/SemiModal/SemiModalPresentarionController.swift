//
//  SemiModalPresentarionController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/12/01.
//

import UIKit

final class SemiModalPresentarionController: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return CGRect.zero }
        var presentedViewFrame = CGRect.zero
        let containerBounds = containerView.bounds
        presentedViewFrame.size = self.size(forChildContentContainer: self.presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = containerBounds.size.width - presentedViewFrame.size.width
        presentedViewFrame.origin.y = containerBounds.size.height - presentedViewFrame.size.height
        return presentedViewFrame
    }
    
    private let overlay: SemiModalOverlayView

    private let presentedViewControllerHeightRatio: CGFloat = 0.5
    
    init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, overlayView: SemiModalOverlayView) {
        self.overlay = overlayView
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        if let delegate = presentedViewController as? SemiModalPresenterDelegate {
            return CGSize(width: parentSize.width, height: delegate.semiModalContentHeight)
        }
        
        return CGSize(width: parentSize.width, height: parentSize.height * self.presentedViewControllerHeightRatio)
    }
    
    override func containerViewWillLayoutSubviews() {
        guard let containerView = containerView else { return }
        
        overlay.frame = containerView.bounds
        containerView.insertSubview(overlay, at: 0)
        
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func presentationTransitionWillBegin() {
        presentedViewController.transitionCoordinator?
            .animate(alongsideTransition: { _ in
            self.overlay.isActive = true
            }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?
            .animate(alongsideTransition: { _ in
                self.overlay.isActive = false
            }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            overlay.removeFromSuperview()
        }
    }
}
