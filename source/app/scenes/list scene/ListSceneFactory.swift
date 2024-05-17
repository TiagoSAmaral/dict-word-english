//
//  ListSceneFactory.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import UIKit

enum ListSceneFactory {
    
    static func makeScene(with content: IModel? = nil) -> UIViewController? {
        let controller = ListController()
        controller.title = "List Controller"
        
        return controller
    }
}
