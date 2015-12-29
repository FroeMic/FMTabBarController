//
//  FMTabBar.swift
//  Demo
//
//  Created by Michael Fröhlich on 29/12/15.
//  Copyright © 2015 FMTabBar. All rights reserved.
//


import UIKit

class FMTabBar: UIView {
    // MARK: class properties
    var buttons: [FMTabbarButton]! = [FMTabbarButton]() {
        didSet {
            self.removeSubViews()
            initViews()
        }
    }
    private var spacingContainerViews = [UIView]() // needed for even spacing of the buttons
    private var height = 48
    private var upperStrokeView = UIView()
    
    // MARK: computed properties
    var strokeColor: UIColor? {
        get {
            return upperStrokeView.backgroundColor
        }
        set {
            upperStrokeView.backgroundColor = newValue
        }
    }
    
    var strokeStrength: CGFloat {
        get {
            return upperStrokeView.frame.height
        }
        set {
            upperStrokeView.removeConstraint(upperStrokeView.constraints[0])
            upperStrokeView.fixedHeightConstraint(newValue)
        }
    }
    
    
    // MARK: initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup([FMTabbarButton](), height: 48)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup([FMTabbarButton](), height: 48)
    }
    
    convenience init(buttons: [FMTabbarButton], height: CGFloat) {
        self.init(frame: CGRect.zero)
        setup(buttons, height: height)
    }
    
    convenience init(buttons: [FMTabbarButton]) {
        self.init(frame: CGRect.zero)
        setup(buttons, height: 48)
    }
    
    private func setup(buttons: [FMTabbarButton], height: CGFloat) {
        self.buttons = buttons
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(hexValue: 0xf7f7f7)
        self.fixedHeightConstraint(height)
    }
    
    private func initViews() {
        initStrokeView()
        initSpacingContainerViews()
        initButtons()
    }
    
    private func initSpacingContainerViews() {
        let count = buttons.count
        for i in 0 ..< count {
            self.spacingContainerViews.append(UIView())
            self.spacingContainerViews[i].translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(spacingContainerViews[i])
            
            self.centerVertically(subview: spacingContainerViews[i], constant: 0)
            self.relativeHeightConstraint(subview: spacingContainerViews[i], multiplier: 1.0, relatedBy: NSLayoutRelation.Equal)
            self.relativeWidthConstraint(subview: spacingContainerViews[i], multiplier: CGFloat(1.0 / Double(count)), relatedBy: NSLayoutRelation.Equal)
            
            if i == 0 {
                self.pinToLeading(subview: spacingContainerViews[i], constant: 1.0)
            } else {
                let leadingSibling = NSLayoutConstraint(item: spacingContainerViews[i], attribute: .Leading,
                    relatedBy: .Equal, toItem: spacingContainerViews[i - 1], attribute: .Trailing,
                    multiplier: 1.0, constant: 0)
                self.addConstraint(leadingSibling)
            }
        }
    }
    
    private func initButtons() {
        for i in 0 ..< buttons.count {
            buttons[i].tag = i
            buttons[i].translatesAutoresizingMaskIntoConstraints = false
            
            self.spacingContainerViews[i].addSubview(buttons[i])
            spacingContainerViews[i].relativeHeightConstraint(subview: buttons[i], multiplier: 1.0, relatedBy: NSLayoutRelation.Equal)
            spacingContainerViews[i].center(subview: buttons[i], constantX: 0, constantY: 0)
            spacingContainerViews[i].relativeWidthConstraint(subview: buttons[i], multiplier: 1.0, relatedBy: NSLayoutRelation.Equal)
            spacingContainerViews[i].relativeWidthConstraint(subview: buttons[i], multiplier: 1.0, relatedBy: NSLayoutRelation.LessThanOrEqual)
        }
        selectButtonByIndex(index: 0)
    }
    
    /**
     Sets up the constraints for the upperStrokeView.
     */
    private func initStrokeView() {
        //TODO: refactor colors, height usw
        strokeColor = UIColor(hexValue: 0xA2A2A2)
        upperStrokeView.translatesAutoresizingMaskIntoConstraints = false
        upperStrokeView.fixedHeightConstraint(0.25)
        
        self.addSubview(upperStrokeView)
        self.relativeWidthConstraint(subview: upperStrokeView, multiplier: 1.0, relatedBy: NSLayoutRelation.Equal)
        self.pinToTop(subview: upperStrokeView, constant: 0)
        self.centerHorizontally(subview: upperStrokeView, constant: 0)
    }
    
    // MARK:
    func selectButtonByIndex(index i: Int) {
        if i >= 0 && i < buttons.count {
            deselectAllButtons()
            buttons[i].selected = true
        }
    }
    
    // MARK private methods
    private func deselectAllButtons() {
        for button in buttons {
            button.selected = false
        }
    }
}
