//
//  LoadingView.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import UIKit

class LoadingViewController: UIViewController {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .white
        indicator.startAnimating()
        indicator.autoresizingMask = [
                    .flexibleLeftMargin,
                    .flexibleRightMargin,
                    .flexibleTopMargin,
                    .flexibleBottomMargin,
                    ]
        return indicator
    }()
    
    lazy var effectBlurView: UIVisualEffectView = {
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.alpha = 0.6
        effectView.autoresizingMask = [
            .flexibleHeight, .flexibleWidth
        ]
        
        return effectView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defineLayout()
    }
    
    func defineLayout() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        effectBlurView.frame = self.view.bounds
        view.insertSubview(effectBlurView, at: 0)
        activityIndicator.center = CGPoint(
             x: view.bounds.midX,
             y: view.bounds.midY
         )
         view.addSubview(activityIndicator)
    }
}
