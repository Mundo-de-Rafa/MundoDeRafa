//
//  OnboardingViewController.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 17/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, HomeDefaultViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
        let onboardingView = OnboardingView()
        onboardingView.viewController = self
        view = onboardingView
    }
    
    func didTapButton() {
        self.navigationController?.pushViewController(MainMenuViewController(), animated: true)
    }
    
}
