//
//  MainMenuViewController.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 21/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, HomeDefaultViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        let mainMenuView = MainMenuView()
        mainMenuView.viewController = self
        view = mainMenuView
    }
    
    func didTapButton() {
        self.navigationController?.pushViewController(StoriesViewController(), animated: true)
    }
}
