//
//  MainMenuView.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 21/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class MainMenuView: HomeDefaultView {

    let audioButtonsStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let soundButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "sound_on_back_white"), for: .normal)
        button.addTarget(self, action: #selector(soundButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let musicButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "music_on_back_white"), for: .normal)
        button.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCenterImage(with: UIImage(named: "rafa_and_planet"))
        setButtonText(with: "Jogar")
        setupAudioButtonsStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAudioButtonsStack() {
        self.addSubview(audioButtonsStack)
        audioButtonsStack.addArrangedSubview(soundButton)
        audioButtonsStack.addArrangedSubview(musicButton)
        NSLayoutConstraint.activate([
            audioButtonsStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            audioButtonsStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32),
            audioButtonsStack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
            audioButtonsStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.16)
        ])
    }
    
    @objc func soundButtonTapped() {
        if let menuViewController = viewController as? MainMenuViewController {
            menuViewController.switchSound()
        }
    }
    
    @objc func musicButtonTapped() {
        if let menuViewController = viewController as? MainMenuViewController {
            menuViewController.switchMusic()
        }
    }
}
