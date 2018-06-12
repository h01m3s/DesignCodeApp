//
//  PresentSectionViewController.swift
//  DesignCodeApp
//
//  Created by Weijie Lin on 6/11/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class PresentSectionViewController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var cellFrame: CGRect!
    var cellTransform: CATransform3D!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let destination = transitionContext.viewController(forKey: .to) as! SectionViewController
        let containerView = transitionContext.containerView
        
        containerView.addSubview(destination.view)
        
        // Initial state
        
        let widthConstraint = destination.scrollView.widthAnchor.constraint(equalToConstant: 304)
        let heightConstraint = destination.scrollView.heightAnchor.constraint(equalToConstant: 248)
        let bottomConstraint = destination.scrollView.bottomAnchor.constraint(equalTo: destination.coverView.bottomAnchor)
        
        NSLayoutConstraint.activate([widthConstraint, heightConstraint, bottomConstraint])
        
        let translate = CATransform3DMakeTranslation(cellFrame.origin.x, cellFrame.origin.y, 0.0)
        let transform = CATransform3DConcat(translate, cellTransform)
        
        destination.view.layer.transform = transform
        destination.view.layer.zPosition = 999
        
        containerView.layoutIfNeeded()
        
        destination.scrollView.layer.cornerRadius = 14
        destination.scrollView.layer.shadowOpacity = 0.25
        destination.scrollView.layer.shadowOffset.height = 10
        destination.scrollView.layer.shadowRadius = 20
        
        let moveUpTransform = CGAffineTransform(translationX: 0, y: -100)
        let scaleUpTransform = CGAffineTransform(scaleX: 2, y: 2)
        let removeFromViewTransform = moveUpTransform.concatenating(scaleUpTransform)
        
        destination.closeVisualEffectView.alpha = 0
        destination.closeVisualEffectView.transform = removeFromViewTransform
        
        destination.subheadVisualEffectView.alpha = 0
        destination.subheadVisualEffectView.transform = removeFromViewTransform
        
        let animator = UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.7) {
            
            // Final state
            
            NSLayoutConstraint.deactivate([widthConstraint, heightConstraint, bottomConstraint])
            
            destination.view.layer.transform = CATransform3DIdentity
            
            containerView.layoutIfNeeded()
            
            destination.scrollView.layer.cornerRadius = 0
            
            destination.closeVisualEffectView.alpha = 1
            destination.closeVisualEffectView.transform = .identity
            
            destination.subheadVisualEffectView.alpha = 1
            destination.subheadVisualEffectView.transform = .identity
            
            let scaleTitleTransform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            let moveTitleTransform = CGAffineTransform(translationX: 30, y: 10)
            
            let titleTransform = scaleTitleTransform.concatenating(moveTitleTransform)
            
            destination.titleLabel.transform = titleTransform
        }
        
        animator.addCompletion { (finished) in
            
            // Completion
            
            transitionContext.completeTransition(true)
        }
        
        animator.startAnimation()
        
    }

}
