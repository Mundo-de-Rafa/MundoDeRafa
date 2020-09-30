//
//  PuseView.swift
//  MundoDeRafa
//
//  Created by Felipe Santana on 25/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class PauseView: UIView {

    var compactConstraints: [NSLayoutConstraint] = []
    var regularConstraints: [NSLayoutConstraint] = []
    var sharedConstraints: [NSLayoutConstraint] = []
    var controller: PauseViewController?
    
    lazy var pauseLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Pausado"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.primaryPurple
        label.font = UIFont.balsamiqB?.withSize(64)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var resumeButton: UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "play_button_back_green"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(resumeAction), for: .touchUpInside)
        
        return button
    }()
    
    lazy var resumeLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Retomar"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.primaryPurple
        label.font = UIFont.neatly?.withSize(32)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var sceneMenuButton: UIButton = {
        let button = RoundButton()
        button.backgroundColor = UIColor.primaryGreen
        button.setTitle("Mudar Cena", for: .normal)
        button.titleLabel?.font = UIFont.balsamiqB?.withSize(22)
        button.addTarget(self, action: #selector(didTapMenuButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var audioButtonStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 64
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    lazy var soundButton: UIButton = {
        let button = UIButton()
        let isSoundOn = UserDefaults.standard.bool(forKey: "isSoundOn")
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(isSoundOn ? UIImage(named: "sound_on_back_green") : UIImage(named: "sound_off_back_green"), for: .normal)
        button.addTarget(self, action: #selector(soundButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var musicButton: UIButton = {
        let button = UIButton()
        let isMusicOn = UserDefaults.standard.bool(forKey: "isMusicOn")
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(isMusicOn ? UIImage(named: "music_on_back_green") : UIImage(named: "music_off_back_green"), for: .normal)
        button.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var soundLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Som"
        label.textColor = UIColor.primaryPurple
        label.font = UIFont.neatly?.withSize(32)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var musicLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Música"
        label.textColor = UIColor.primaryPurple
        label.font = UIFont.neatly?.withSize(32)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setupUI() {
        self.backgroundColor = .backgroundWhite
        setupComponents()
        setLayoutTrait(traitCollection: UIScreen.main.traitCollection)
    }
    
    func setLayoutTrait(traitCollection:UITraitCollection) {
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
        } else {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
            pauseLabel.font = UIFont.balsamiqB?.withSize(32)
            resumeLabel.font = UIFont.neatly?.withSize(16)
            sceneMenuButton.titleLabel?.font = UIFont.balsamiqB?.withSize(11)
            soundLabel.font = UIFont.neatly?.withSize(16)
            musicLabel.font = UIFont.neatly?.withSize(16)
            audioButtonStack.spacing = 32
        }
    }
    
    private func setupComponents() {
        self.addSubview(pauseLabel)
        self.addSubview(resumeButton)
        self.addSubview(resumeLabel)
        self.addSubview(sceneMenuButton)
        self.addSubview(audioButtonStack)
        self.addSubview(soundLabel)
        self.addSubview(musicLabel)
        
        audioButtonStack.addArrangedSubview(soundButton)
        audioButtonStack.addArrangedSubview(musicButton)
        
        regularConstraints.append(contentsOf: [
            pauseLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pauseLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 48),
            
            resumeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resumeButton.topAnchor.constraint(equalTo: pauseLabel.bottomAnchor, constant: 118),
            resumeButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/10),
            resumeButton.widthAnchor.constraint(equalTo: self.resumeButton.heightAnchor),
            
            resumeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resumeLabel.topAnchor.constraint(equalTo: resumeButton.bottomAnchor, constant: 24),
            
            sceneMenuButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sceneMenuButton.topAnchor.constraint(lessThanOrEqualTo: resumeLabel.bottomAnchor, constant: 120),
            sceneMenuButton.widthAnchor.constraint(equalToConstant: 223),
            sceneMenuButton.heightAnchor.constraint(equalToConstant: 55),
            
            audioButtonStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            audioButtonStack.topAnchor.constraint(equalTo: sceneMenuButton.bottomAnchor, constant: 44),
            audioButtonStack.heightAnchor.constraint(equalToConstant: 78),
            
            soundLabel.topAnchor.constraint(equalTo: audioButtonStack.bottomAnchor, constant: 8),
            soundLabel.centerXAnchor.constraint(equalTo: soundButton.centerXAnchor),
            soundLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            
            musicLabel.topAnchor.constraint(equalTo: audioButtonStack.bottomAnchor, constant: 8),
            musicLabel.centerXAnchor.constraint(equalTo: musicButton.centerXAnchor),
            musicLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
        ])
        
        compactConstraints.append(contentsOf: [
            pauseLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pauseLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            resumeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resumeButton.topAnchor.constraint(equalTo: pauseLabel.bottomAnchor, constant: 36),
            resumeButton.heightAnchor.constraint(equalToConstant: 120),
            resumeButton.widthAnchor.constraint(equalTo: self.resumeButton.heightAnchor),
            
            resumeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resumeLabel.topAnchor.constraint(equalTo: resumeButton.bottomAnchor, constant: 12),
            
            sceneMenuButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sceneMenuButton.topAnchor.constraint(lessThanOrEqualTo: resumeLabel.bottomAnchor, constant: 24),
            sceneMenuButton.widthAnchor.constraint(equalToConstant: 114),
            sceneMenuButton.heightAnchor.constraint(equalToConstant: 28),
            
            audioButtonStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            audioButtonStack.topAnchor.constraint(equalTo: sceneMenuButton.bottomAnchor, constant: 24),
            audioButtonStack.heightAnchor.constraint(equalToConstant: 38),
            
            soundLabel.topAnchor.constraint(equalTo: audioButtonStack.bottomAnchor, constant: 8),
            soundLabel.centerXAnchor.constraint(equalTo: soundButton.centerXAnchor),
            soundLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -11),
            
            musicLabel.topAnchor.constraint(equalTo: audioButtonStack.bottomAnchor, constant: 8),
            musicLabel.centerXAnchor.constraint(equalTo: musicButton.centerXAnchor),
            musicLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -11)
        ])
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func resumeAction() {
        self.controller?.resume()
        resumeButton.playSoundIfNeeded(of: .click)
    }
    
    @objc func soundButtonTapped() {
        if let pauseController = controller {
            pauseController.switchSound()
            soundButton.playSoundIfNeeded(of: .click)
        }
    }
    
    @objc func musicButtonTapped() {
        if let pauseController = controller {
            pauseController.switchMusic()
            musicButton.playSoundIfNeeded(of: .click)
        }
    }

    @objc func didTapMenuButton() {
        if let pauseController = controller {
            pauseController.goToScenes()
        }
    }
}
