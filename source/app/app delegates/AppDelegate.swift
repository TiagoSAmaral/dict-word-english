//
//  AppDelegate.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 15/05/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        SceneStarter.makeScene(into: window)
        return true
    }
}