//
//  FMTabBarSegue.swift
//  Demo
//
//  Created by Michael Fröhlich on 29/12/15.
//  Copyright © 2015 FMTabBar. All rights reserved.
//

import UIKit

class FMTabBarSegue: UIStoryboardSegue {
    override func perform() {
        let tabBarController = self.sourceViewController as! FMTabBarController
        let destinationController = self.destinationViewController as UIViewController
        let contentView = tabBarController.contentView
        
        // remove old subviews
        contentView.removeSubViews()
        
        // Add view to placeholder view
        tabBarController.currentViewController = destinationController
        contentView.addSubview(destinationController.view)
        
        // Set autoresizing
        contentView.translatesAutoresizingMaskIntoConstraints = false
        destinationController.view.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        
        contentView.addConstraints(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        
        contentView.addConstraints(verticalConstraint)
        
        contentView.layoutIfNeeded()
        destinationController.didMoveToParentViewController(tabBarController)
    }
}


