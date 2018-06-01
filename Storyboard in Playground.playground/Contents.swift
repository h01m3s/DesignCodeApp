import PlaygroundSupport
import UIKit

class ViewController : CardController {
    
    override func loadView() {
        Bundle.main.loadNibNamed("View", owner: self, options: nil)
    }
    
    override func tapCard(_ sender: AnyObject) {
        NSLayoutConstraint.deactivate(cardConstraints)
        closeButton.isHidden = false
        
        let animator = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.7) {
            self.closeButton.layer.opacity = 1
            self.card.layer.cornerRadius = 0
            self.card.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
    
    override func tapClose(_ sender: AnyObject) {
        NSLayoutConstraint.activate(cardConstraints)
        closeButton.isHidden = true
        
        let animator = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.7) {
            self.closeButton.layer.opacity = 0
            self.card.layer.cornerRadius = 14
            self.card.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
    
}

PlaygroundPage.current.liveView = ViewController()
