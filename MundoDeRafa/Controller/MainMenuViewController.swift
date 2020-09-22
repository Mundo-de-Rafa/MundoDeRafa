//
//  MainMenuViewController.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 21/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, HomeDefaultViewController {

    var isMusicOn: Bool = true
    var isSoundOn: Bool = true
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    override func loadView() {
        let mainMenuView = MainMenuView()
        mainMenuView.viewController = self
        view = mainMenuView
    }
    
    func didTapButton() {
        self.navigationController?.pushViewController(StoryViewController(), animated: true)
    }
    
    func switchSound() {
        isSoundOn = !isSoundOn
        guard let view = view as? MainMenuView else { return }
        view.soundButton.setImage(isSoundOn ? UIImage(named: "sound_on_back_white"):
                                              UIImage(named: "sound_off_back_white"), for: .normal)
        print("Switch sound on to\(isSoundOn)")
        UserDefaults.standard.setValue(isSoundOn, forKey: "isSoundOn")
    }
    
    func switchMusic() {
        isMusicOn = !isMusicOn
        guard let view = view as? MainMenuView else { return }
        view.musicButton.setImage(isMusicOn ? UIImage(named: "music_on_back_white"):
                                              UIImage(named: "music_off_back_white"), for: .normal)
        print("Switch music on to \(isMusicOn)")
        UserDefaults.standard.setValue(isMusicOn, forKey: "isMusicOn")
    }
}
