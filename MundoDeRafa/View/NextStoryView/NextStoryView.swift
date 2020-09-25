//
//  NetxStoryView.swift
//  MundoDeRafa
//
//  Created by Beatriz Carlos on 18/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class NextStoryView: UIView {
    var compactConstraints: [NSLayoutConstraint] = []
    var regularConstraints: [NSLayoutConstraint] = []
    var sharedConstraints: [NSLayoutConstraint] = []
    var viewController: NextStoryViewController?
    
    lazy var congratulationsImage : UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "congratulationsLabel")
        imageV.translatesAutoresizingMaskIntoConstraints = false
        return imageV
    }()
    
    lazy var buttonRepet: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "restart_button"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var repetLabel : UILabel = {
        let label = UILabel()
        label.text = "Repetir"
        label.textColor = .primaryPurple
        label.font = UIFont.balsamicR?.withSize(UIScreen.main.bounds.height * 0.036)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rafaImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "rafa_baloes")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var buttonNext : UIButton = {
        let button = RoundButton()
        button.backgroundColor = .primaryGreen
        button.setTitle("Próximo", for: .normal)
        button.titleLabel?.font = UIFont.balsamiqB?.withSize(UIScreen.main.bounds.height * 0.036)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction() {
        viewController?.bAction()
        buttonRepet.playSoundIfNeeded(of: .click)
    }
    
    // SETUP.
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
        }
    }
    
    private func setupComponents() {
        self.addSubview(congratulationsImage)
        self.addSubview(buttonRepet)
        self.addSubview(repetLabel)
        self.addSubview(rafaImage)
        self.addSubview(buttonNext)
        
        regularConstraints.append(contentsOf: [
            congratulationsImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            congratulationsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 58),
            congratulationsImage.heightAnchor.constraint(equalToConstant: 163),
            congratulationsImage.widthAnchor.constraint(equalToConstant: 365),
            
            buttonRepet.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonRepet.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonRepet.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/10),
            buttonRepet.widthAnchor.constraint(equalTo: self.buttonRepet.heightAnchor),
            
            repetLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            repetLabel.topAnchor.constraint(equalTo: self.buttonRepet.bottomAnchor, constant: 31),
            
            rafaImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
            rafaImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -23),
            
            buttonNext.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonNext.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -67),
            buttonNext.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/10),
            buttonNext.widthAnchor.constraint(equalToConstant: 313)
        ])
        
        compactConstraints.append(contentsOf: [
            congratulationsImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            congratulationsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            congratulationsImage.heightAnchor.constraint(equalToConstant: 130.4),
            congratulationsImage.widthAnchor.constraint(equalToConstant: 292),
            
            buttonRepet.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonRepet.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 14),
            buttonRepet.heightAnchor.constraint(equalToConstant: 120),
            buttonRepet.widthAnchor.constraint(equalToConstant: 120),

            repetLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            repetLabel.topAnchor.constraint(equalTo: self.buttonRepet.bottomAnchor, constant: 14),

            rafaImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
            rafaImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -23),

            buttonNext.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonNext.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            buttonNext.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/10),
            buttonNext.widthAnchor.constraint(equalToConstant: 313)
        ])
    }
}
