import UIKit

open class CardController : UIViewController {
    @IBOutlet public var card : UIView!
    @IBOutlet public var closeButton : UIButton!
    
    @IBOutlet public var cardConstraints : Array<NSLayoutConstraint>!
    
    @IBAction open func tapCard (_ sender : AnyObject) {}
    @IBAction open func tapClose (_ sender : AnyObject) {}
}
