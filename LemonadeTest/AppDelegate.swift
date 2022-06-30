//
//  AppDelegate.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let landingVC = DIContainer.makeLandingVC()
        let rootNav = UINavigationController(rootViewController: landingVC)
        window?.rootViewController = rootNav
        window?.makeKeyAndVisible()
        return true
    }


}

