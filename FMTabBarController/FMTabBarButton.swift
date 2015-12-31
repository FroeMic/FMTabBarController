//
//  FMTabBarButton.swift
//  Demo
//
//  Created by Michael Fröhlich on 29/12/15.
//  Copyright © 2015 FMTabBar. All rights reserved.
//


import UIKit

class FMTabbarButton: UIView {
    // MARK: class properties
    var imageView: UIImageView? {
        didSet {
            positionSubviews()
        }
    }
    var titleLabel: UILabel? {
        didSet {
            positionSubviews()
        }
    }
    var selected: Bool = false {
        didSet {
            updateColors()
            animate()
        }
    }
    var showTitle = false {
        didSet {
            positionSubviews()
        }
    }
    var tintColorOfButtonsWhenSelected = UIColor(hexValue: 0x0c78be) {
        didSet {
            updateColors()
        }
    }
    var tintColorOfButtonsWhenDeselected = UIColor(hexValue: 0x929292) {
        didSet {
            updateColors()
        }
    }
    
    
    // MARK: computed properties
    var image: UIImage? {
        get {
            return imageView?.image
        }
        set {
            guard let newValue = newValue else {
                imageView?.removeFromSuperview()
                imageView = nil
                return
            }
            
            guard let imageView = imageView else {
                initImage(newValue)
                return
            }
            
            imageView.image = newValue.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            positionSubviews()
        }
    }
    
    var title: String? {
        get {
            return titleLabel?.text
        }
        set {
            guard let newValue = newValue else {
                titleLabel?.removeFromSuperview()
                titleLabel = nil
                return
            }
            
            guard let titleLabel = titleLabel else {
                initTitleLabel(newValue)
                return
            }
            
            titleLabel.text = newValue
            positionSubviews()
        }
    }
    
    
    // MARK: initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    convenience init(title: String, image: UIImage, showTitle: Bool) {
        self.init()
        self.title = title
        self.image = image
        self.showTitle = showTitle
        positionSubviews()
    }
    
    convenience init(image: UIImage) {
        self.init()
        self.image = image
        positionSubviews()
    }
    
    convenience init(title: String, showTitle: Bool) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.fixedRatioConstraint(1.0)
        self.title = title
        self.showTitle = showTitle
        positionSubviews()
    }
    
    // MARK: private methods
    private func initImage(image: UIImage) {
        if let imageView = imageView {
            imageView.removeFromSuperview()
        }
        let newImageView = UIImageView()
        newImageView.image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        newImageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView = newImageView
        updateColors()
    }
    
    /**
     initializes the titleLabel
     */
    private func initTitleLabel(title: String) {
        if let titleLabel = titleLabel {
            titleLabel.removeFromSuperview()
        }
        let newTitleLabel = UILabel()
        newTitleLabel.text = title
        newTitleLabel.font = newTitleLabel.font.fontWithSize(10)
        newTitleLabel.textAlignment = NSTextAlignment.Center
        newTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel = newTitleLabel
        updateColors()
    }
    
    /**
     Positions alls subviews using constraints.
     */
    private func positionSubviews() {
        self.removeSubViews()
        if let imageView = imageView {
            
            imageView.fixedRatioConstraint(1.0)
            self.addSubview(imageView)
            
            if let titleLabel = titleLabel where showTitle {
                self.addSubview(titleLabel)
                
                // position imageView
                self.pinToTop(subview: imageView, constant: 7.5)
                self.centerHorizontally(subview: imageView, constant: 0)
                self.relativeHeightConstraint(subview: imageView, multiplier: 0.5, relatedBy: NSLayoutRelation.Equal)
                
                let minWidth = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .GreaterThanOrEqual,
                    toItem: imageView, attribute: .Width, multiplier: 1.0, constant: 0)
                self.addConstraint(minWidth)
                
                // position titleLabel
                self.centerHorizontally(subview: titleLabel, constant: 0)
                self.relativeWidthConstraint(subview: titleLabel, multiplier: 0.9, relatedBy: NSLayoutRelation.Equal)
                let constraint = NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal,
                    toItem: titleLabel, attribute: .Top, multiplier: 1.0, constant: -4)
                self.addConstraint(constraint)
            } else {
                // position imageView
                self.center(subview: imageView, constantX: 0, constantY: 0)
                self.relativeHeightConstraint(subview: imageView, multiplier: 0.8, relatedBy: NSLayoutRelation.Equal)
                
                let minWidth = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .GreaterThanOrEqual,
                    toItem: imageView, attribute: .Width, multiplier: 1.0, constant: 0)
                self.addConstraint(minWidth)
            }
        } else if let titleLabel = titleLabel where showTitle {
            self.addSubview(titleLabel)
            // position titleLabel
            self.centerHorizontally(subview: titleLabel, constant: 0)
            self.pinToBottom(subview: titleLabel, constant: -2.0)
            self.relativeWidthConstraint(subview: titleLabel, multiplier: 0.9, relatedBy: NSLayoutRelation.Equal)
        }
    }
    
    /**
     Updates the colors of the title and image.
     */
    private func updateColors() {
        let color = selected ? tintColorOfButtonsWhenSelected : tintColorOfButtonsWhenDeselected
        self.imageView?.tintColor = color
        self.titleLabel?.textColor = color
        self.titleLabel?.tintColor = color
    }
    
    /**
     Animation which is called when a button is selected.
     */
    private func animate() {
        // TODO put fancy animation here
    }
}

