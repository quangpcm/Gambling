//
//  AppDelegate.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

        var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let home = HomeViewController()
        let navi = UINavigationController(rootViewController: home)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
            return true
    }
}

