//
//  ListSceneFactory.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import UIKit

enum ListSceneFactory {
    
    static func makeScene(with content: Model? = nil) -> UIViewController? {
        ListViewController()
    }
}
