//
//  FMTabBarController.swift
//  Demo
//
//  Created by Michael Fröhlich on 29/12/15.
//  Copyright © 2015 FMTabBar. All rights reserved.
//

import UIKit

protocol addGestureRecognizerToFMButtonProtocol {
    func addGestureRecognizerToFMButton(view: FMTabbarButton)
}

class FMTabBarController: UIViewController {
    // MARK: class properties
    var tabBar: FMTabBar!
    var currentViewController = UIViewController()
    var contentView: UIView!
    
    // MARK: overritten methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initTabBar()
        initContentView()
    }
    
    // MARK: initializers
    /**
    places the tabBar on the view and sets constraints
    */
    private func initTabBar() {
        tabBar = FMTabBar()
        tabBar.addGestureRecognizerToViewProtocolDelegate = self
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tabBar)
        self.view.centerHorizontally(subview: tabBar, constant: 0)
        self.view.relativeWidthConstraint(subview: tabBar, multiplier: 1.0, relatedBy: NSLayoutRelation.Equal)
        self.view.pinToBottom(subview: tabBar, constant: 0)
    }
    
    /**
     Places the contentView on the view and sets constraints
     */
    private func initContentView() {
        contentView = UIView()
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.centerHorizontally(subview: contentView, constant: 0)
        self.view.relativeWidthConstraint(subview: contentView, multiplier: 1.0, relatedBy: NSLayoutRelation.Equal)
        self.view.pinToTop(subview: contentView, constant: 0)
        
        let pinBottomToTabBarView = NSLayoutConstraint(item: contentView, attribute: .Bottom, relatedBy: .Equal,
            toItem: tabBar, attribute: .Top, multiplier: 1.0, constant: 0)
        self.view.addConstraint(pinBottomToTabBarView)
    }
    
    func addButtonToTabBar(button: FMTabbarButton) {
        tabBar.buttons.append(button)
    }
    
    /**
     Removes the button at the specified index from the tabBar.
     */
    func removeButtonFromTabBarAtIndex(index i: Int) {
        if i >= 0 && i < tabBar.buttons.count {
            tabBar.buttons.removeAtIndex(i)
            // recalculate tags
            for i in 0 ..< tabBar.buttons.count {
                tabBar.buttons[i].tag = i
            }
        }
    }
    
    /**
     This functions is called per default when a tabBarButton is pressed.
     */
    func tabBarButtonPressed(sender: UITapGestureRecognizer) {
        if let tag = sender.view?.tag {
            tabBar.selectButtonByIndex(index: tag)
        }
    }
}

extension FMTabBarController: addGestureRecognizerToFMButtonProtocol {
    // MARK: protocol functions
    /**
    removes all existing gestureRecognizers from the view and adds a new tapGestureRecognizer
    */
    func addGestureRecognizerToFMButton(view: FMTabbarButton) {
        if let gestureRecognizers = view.gestureRecognizers {
            for gestureRecognizer in gestureRecognizers {
                view.removeGestureRecognizer(gestureRecognizer)
            }
        }
        let newGestureRecognizer = UITapGestureRecognizer(target: self, action: "tabBarButtonPressed:")
        view.addGestureRecognizer(newGestureRecognizer)
    }
}
