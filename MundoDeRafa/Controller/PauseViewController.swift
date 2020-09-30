//
//  PauseViewController.swift
//  MundoDeRafa
//
//  Created by Felipe Santana on 25/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class PauseViewController: UIViewController {

    var isSoundOn: Bool = UserDefaults.standard.bool(forKey: "isSoundOn")
    var isMusicOn: Bool = UserDefaults.standard.bool(forKey: "isMusicOn") {
        didSet {
            isMusicOn ? MusicHelper.shared.playMusic() :
                        MusicHelper.shared.stopMusic()
         }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        let pauseView = PauseView()
        pauseView.controller = self
        
        view = pauseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    public func resume() {
        dismiss(animated: true, completion: nil)
    }
    
    func switchSound() {
        isSoundOn = !isSoundOn
        guard let view = view as? PauseView else { return }
        view.soundButton.setImage(isSoundOn ? UIImage(named: "sound_on_back_green"):
                                              UIImage(named: "sound_off_back_green"), for: .normal)
        print("Switch sound on to \(isSoundOn)")
        UserDefaults.standard.setValue(isSoundOn, forKey: "isSoundOn")
    }
    
    func switchMusic() {
        isMusicOn = !isMusicOn
        guard let view = view as? PauseView else { return }
        view.musicButton.setImage(isMusicOn ? UIImage(named: "music_on_back_green"):
                                              UIImage(named: "music_off_back_green"), for: .normal)
        print("Switch music on to \(isMusicOn)")
        UserDefaults.standard.setValue(isMusicOn, forKey: "isMusicOn")
    }
    
}
