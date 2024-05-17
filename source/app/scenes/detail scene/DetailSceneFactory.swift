//
//  DetailFactory.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import UIKit

enum DetailSceneFactory {
    
    static func makeScene(with content: IModel? = nil) -> UIViewController? {
        let controller = DetailController()
        controller.title = "SigninSignUp Controller"
        
        return controller
    }
}
