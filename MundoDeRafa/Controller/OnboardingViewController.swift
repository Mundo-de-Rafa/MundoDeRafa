//
//  OnboardingViewController.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 17/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        let onboardingView = OnboardingView()
        view = onboardingView
    }
    
}
