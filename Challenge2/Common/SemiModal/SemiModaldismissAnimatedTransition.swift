//
//  SemiModaldismissAnimatedTransition.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/12/01.
//

import UIKit

final class SemimodalDismissAnimatedTransition: NSObject {
}

extension SemimodalDismissAnimatedTransition: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
                        guard let fromView = transitionContext.view(forKey: .from) else {
                            return }
                        fromView.center.y = UIScreen.main.bounds.size.height + fromView.bounds.height / 2
                       },
                       completion: { _ in
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                       })
    }
    
}
