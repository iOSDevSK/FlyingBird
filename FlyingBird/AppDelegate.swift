//
//  AppDelegate.swift
//  FlyingBird
//
//  Created by Filip Dvoran on 12/12/14.
//  Copyright (c) 2014 VANACOM s.r.o. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = GameViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

