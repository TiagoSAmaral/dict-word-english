//
//  SceneStarter.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 15/05/24.
//

import UIKit

final class SceneStarterManager {
    
    static let fetchRemoteBaseWordsManager = FetchRemoteBaseWordsManager()
    static func startView(into window: UIWindow?) {
        
        fetchBaseWordList(window) { isSuccess in
            if isSuccess {
                makeScene(into: window)
            } else {
                // Show window malfunction
            }
        }
    }
    
    private static func fetchBaseWordList(_ window: UIWindow?, handler: ((Bool) -> Void)?) {
        
        let existBaseList = fetchRemoteBaseWordsManager.hasItemsIn(collection: WordEntity.self)

        guard existBaseList else {
            startLoading(into: window)
            fetchRemoteBaseWordsManager.fetchBaseList(handler: handler)
            return
        }
        handler?(existBaseList)
    }
    
    private static func makeScene(into window: UIWindow?) {
        
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
    
    private static func startLoading(into window: UIWindow?) {
        window?.rootViewController = LoadingViewController()
        window?.makeKeyAndVisible()
    }

    private static func makeNavigation() -> UINavigationController {
        NavigationController()
    }
}
