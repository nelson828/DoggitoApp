//
//  AppDelegate.swift
//  DoggitosApp
//
//  Created by Nelson Ramirez on 2/26/18.
//  Copyright © 2018 Nelson Ramirez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let mainVC = BreedVC()
        window?.rootViewController = UINavigationController(rootViewController: mainVC)
                
        return true
    }

}

