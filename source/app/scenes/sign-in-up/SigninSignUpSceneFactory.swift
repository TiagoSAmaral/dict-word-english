//
//  SigninSignUpFactory.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import UIKit

enum SigninSignUpSceneFactory {
    
    static func makeScene(with content: IModel? = nil) -> UIViewController? {
        let controller = SigninSignUpController()
        controller.title = "SigninSignUp Controller"
        
        return controller
    }
}
