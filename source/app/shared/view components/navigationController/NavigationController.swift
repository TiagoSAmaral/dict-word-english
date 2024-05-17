//
//  NavigationController.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import UIKit

class NavigationController: UINavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        defineApperance()
        fixBartintColoriOS15()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defineApperance()
        fixBartintColoriOS15()
    }
    
    func defineApperance() {
        navigationBar.isTranslucent = false
        defineBackbuttonApperance()
    }
    
    private func fixBartintColoriOS15() {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = ColorAssets.mainColor
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        }
    }
    
    func defineBackbuttonApperance() {
        navigationBar.barTintColor = ColorAssets.mainColor
    }
}
