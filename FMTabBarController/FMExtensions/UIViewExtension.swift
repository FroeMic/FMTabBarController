import UIKit

extension UIView {
    /**
     Adds rounded edges by the specified factor relative to the views width to the view.
     */
    func roundEdgesWithFactor(factor: CGFloat) {
        self.layer.cornerRadius = self.frame.size.width * factor
        self.clipsToBounds = true
    }
    
    /**
     Removes all subviews from the view.
     */
    func removeSubViews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    // MARK: constraint extensions
    // All the constraints are added to the view on which the method is called.
    
    /**
    Pins the top of the subview to the top of the view.
    */
    func pinToTop(subview view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .Top, relatedBy: .Equal,
            toItem: self, attribute: .Top, multiplier: 1.0, constant: constant)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Pins the bottom of the subview to the bottom of the view.
     */
    func pinToBottom(subview view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .Bottom, relatedBy: .Equal,
            toItem: self, attribute: .Bottom, multiplier: 1.0, constant: constant)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Pins the leading of the subview to the leading view.
     */
    func pinToLeading(subview view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .Leading, relatedBy: .Equal,
            toItem: self, attribute: .Leading, multiplier: 1.0, constant: constant)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Pins the trailing of the subview to the trailing view.
     */
    func pinToTrailing(subview view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .Leading, relatedBy: .Equal,
            toItem: self, attribute: .Leading, multiplier: 1.0, constant: constant)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Centers the subview horizontally in the view.
     */
    func centerHorizontally(subview view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .CenterX, relatedBy: .Equal,
            toItem: self, attribute: .CenterX, multiplier: 1.0, constant: constant)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Aligns the horizontal centers of the subviews.
     */
    func centerHorizontally(subview1 view1: UIView, subview2 view2: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view1, attribute: .CenterX, relatedBy: .Equal,
            toItem: view2, attribute: .CenterX, multiplier: 1.0, constant: constant)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Centers the subview horizontally in the view.
     */
    func centerVertically(subview view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .CenterY, relatedBy: .Equal,
            toItem: self, attribute: .CenterY, multiplier: 1.0, constant: constant)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Aligns the vertical centers of the subviews.
     */
    func centerVertically(subview1 view1: UIView, subview2 view2: UIView, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view1, attribute: .CenterY, relatedBy: .Equal,
            toItem: view2, attribute: .CenterY, multiplier: 1.0, constant: constant)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Centers the subview horizontally and vertically in the view.
     */
    func center(subview view: UIView, constantX: CGFloat, constantY: CGFloat) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(self.centerHorizontally(subview: view, constant: constantX))
        constraints.append(self.centerVertically(subview: view, constant: constantY))
        return constraints
    }
    
    /**
     Aligns the centers of the subviews horizontally and vertically in the view.
     */
    func center(subview1 view1: UIView, subview2 view2: UIView, constantX: CGFloat, constantY: CGFloat) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(self.centerHorizontally(subview1: view1, subview2: view2, constant: constantX))
        constraints.append(self.centerVertically(subview1: view1, subview2: view2, constant: constantY))
        return constraints
    }
    
    /**
     Sets constraint for the height of the subview to be the dependent on this view's height.
     */
    func relativeHeightConstraint(subview view: UIView, multiplier: CGFloat, relatedBy: NSLayoutRelation) -> NSLayoutConstraint {
        view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.width, self.frame.height * multiplier)
        let constraint = NSLayoutConstraint(item: view, attribute: .Height, relatedBy: relatedBy,
            toItem: self, attribute: .Height, multiplier: multiplier, constant: 0)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Sets constraint for the width of the subview to be the dependent on this view's width.
     */
    func relativeWidthConstraint(subview view: UIView, multiplier: CGFloat, relatedBy: NSLayoutRelation) -> NSLayoutConstraint {
        view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, self.frame.width * multiplier, view.frame.height)
        let constraint = NSLayoutConstraint(item: view, attribute: .Width, relatedBy: relatedBy,
            toItem: self, attribute: .Width, multiplier: multiplier, constant: 0)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Sets height constraint for view.
     */
    func fixedHeightConstraint(height: CGFloat) -> NSLayoutConstraint {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width, height)
        let constraint = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Sets width constraint for view.
     */
    func fixedWidthConstraint(width: CGFloat) -> NSLayoutConstraint {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.height)
        let constraint = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: width)
        self.addConstraint(constraint)
        return constraint
    }
    
    /**
     Sets fixed ration constraint for view.
     */
    func fixedRatioConstraint(ratio: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal,
            toItem: self, attribute: .Height, multiplier: ratio, constant: 0)
        self.addConstraint(constraint)
        return constraint
    }
}

