//
//  AppDelegate.swift
//  CellSwipeTransition
//
//  Created by Luke on 23/06/2017.
//  Copyright © 2017 Luke. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstVc = ViewController()
        
        let initialViewController: SWNavigationController = SWNavigationController(rootViewController: firstVc)
        print(initialViewController.interactivePushGestureRecognizer is UIScreenEdgePanGestureRecognizer)
        
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    

}

