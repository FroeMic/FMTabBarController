# FMTabBarController
A lightweight TabBar ViewController which allows various customisations not possible with the default TabBar.

## Open issues

* add a demo project
* add a proper usage documentation
* add optional animations to FMTabBarButton

## Requirements

iOS 9.1 or higher

## Usage
 1. Add the project files from the 'FMTabBarController' Folder to your project.
 2. Go to the ViewController.swift file of your root ViewController and make it inherit from 'FMTabBarController'
 3. In your viewDidLoad() you can now add buttons to the tabbar and customize it further. (Have a look at the demo project to get a better understanding.)
 4. In order to make the segues work, just go to your storyboard and add segues by ctrl - dragging from your root viewController to your destination viewController. Change the type of the segue to 'FMTabBarSegue' in the attribues inspector and assign a identifier. (I recommend something like 'VC-i', where is the i-th button of the tabBar.)
 5. By overwriting the tabBarButtonPressed() method in your ViewController.swift file you can e.g. call performSegueWithIdentifier() by making use of the 'tag' property of the FMTabBarButton in order to trigger the proper segue. (or do complete different stuff ;-) )

##License 

The MIT License (MIT)

Copyright (c) 2015 Michael Fröhlihc (M.Froehlich1994@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.