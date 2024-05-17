//
//  SceneStarter.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 15/05/24.
//

import UIKit

final class SceneStarter {
    
    static func makeScene(into window: UIWindow?) {
        
        guard let window = window else {
            fatalError("File: \(#file) \n \(#function) \n Error Description: Is not possible render scenes. Need a UIWindow valid instance.")
        }
        
        guard let controller = ListSceneFactory.makeScene() else {
            fatalError("File: \(#file) \n \(#function) \n Error Description: Is not possible render scenes. Need a UIViewController valid instance.")
        }
        
        let navigation = makeNavigation()
        navigation.viewControllers = [controller]
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
    
    static func makeNavigation() -> UINavigationController {
        NavigationController()
    }
}
