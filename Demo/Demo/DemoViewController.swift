//
//  ViewController.swift
//  Demo
//
//  Created by Michael Fröhlich on 29/12/15.
//  Copyright © 2015 FMTabBar. All rights reserved.
//

import UIKit

class DemoViewController: FMTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add customisation of the FMTabBar here:
        setUpFMTabBar()
        
    }
    
    /**
     FMTabBarButtons are added to the FMTabBar.
    */
    private func setUpFMTabBar() {
        self.addButtonToTabBar(FMTabbarButton(title: "Home", image: UIImage(named: "icon_tabbar_house_s")!, showTitle: true))
        self.addButtonToTabBar(FMTabbarButton(title: "Add", image: UIImage(named: "icon_tabbar_plus_s")!, showTitle: true))
        self.addButtonToTabBar(FMTabbarButton(title: "Settings", image: UIImage(named: "icon_tabbar_settings_s")!, showTitle: true))
        
        // select the first ViewController on startup (see Main.storyboard)
        performSegueWithIdentifier("VC-0", sender: self.tabBar.buttons[0])
    }
    
    /**
     Override tabBarButtonPressed() method in order to customize what should happen when a FMTabBarButton is pressed.
     */
    override func tabBarButtonPressed(sender: UITapGestureRecognizer) {
        super.tabBarButtonPressed(sender)

        if let tag = sender.view?.tag {
            performSegueWithIdentifier("VC-\(tag)", sender: sender.view as? FMTabbarButton)
        }
    }

}

