//
//  NetxStoryView.swift
//  MundoDeRafa
//
//  Created by Beatriz Carlos on 18/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class NextStoryView: UIView {
    private var regularConstraints: [NSLayoutConstraint] = []

    
    lazy var congratulationsImage : UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "congratulationsLabel")
        imageV.translatesAutoresizingMaskIntoConstraints = false
        return imageV
    }()
    
    lazy var buttonRepet: UIButton = {
        let button = RoundButton()
        button.backgroundColor = .primaryGreen
        button.setImage(UIImage(named: "restart_button"), for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var repetLabel : UILabel = {
        let label = UILabel()
        label.text = "Repetir"
        label.textColor = .primaryPurple
        label.font = UIFont.systemFont(ofSize: 32)
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupCongratulationsImage()
        //setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCongratulationsImage() {
        self.addSubview(congratulationsImage)
        
        // constrants for ipad
        regularConstraints.append(contentsOf: [
            congratulationsImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            congratulationsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 58),
            congratulationsImage.heightAnchor.constraint(equalToConstant: 163),
            congratulationsImage.widthAnchor.constraint(equalToConstant: 365)
        ])
        
        NSLayoutConstraint.activate([
            congratulationsImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            congratulationsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 58),
            congratulationsImage.heightAnchor.constraint(equalToConstant: 163),
            congratulationsImage.widthAnchor.constraint(equalToConstant: 365)
        ])
    }
    
//    func layoutTrait(traitCollection:UITraitCollection) {
////        if (!sharedConstraints[0].isActive) {
////           // activating shared constraints
////           NSLayoutConstraint.activate(sharedConstraints)
////        }
//        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
//            if regularConstraints.count > 0 && regularConstraints[0].isActive {
//                NSLayoutConstraint.deactivate(regularConstraints)
//            }
//            // ativando as constantes para dispositivos compactos.
//            //NSLayoutConstraint.activate(compactConstraints)
//        }
//        // ativando as constantes para dispositivos regulares
//        else {
////            if compactConstraints.count > 0 && compactConstraints[0].isActive {
////                NSLayoutConstraint.deactivate(compactConstraints)
////            }
//            // activating regular constraints
//            NSLayoutConstraint.activate(regularConstraints)
//        }
//    }
    
    func layoutTrait(traitCollection:UITraitCollection) {
        // ipad 
    }
    
    private func setupComponents() {
        self.addSubview(buttonRepet)
        NSLayoutConstraint.activate([
            buttonRepet.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonRepet.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonRepet.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/10),
            buttonRepet.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 2/10)
        ])
        
        self.addSubview(repetLabel)
        NSLayoutConstraint.activate([
            repetLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            repetLabel.topAnchor.constraint(equalTo: self.buttonRepet.bottomAnchor, constant: 31)
        ])
        
        self.addSubview(rafaImage)
        NSLayoutConstraint.activate([
            rafaImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
            rafaImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -23)
        ])
        
        self.addSubview(buttonNext)
        NSLayoutConstraint.activate([
            buttonNext.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonNext.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -67),
            buttonNext.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/10),
            buttonNext.widthAnchor.constraint(equalToConstant: 313)
        ])
    }
    
    private func setupUI() {
        self.backgroundColor = .backgroundWhite
    }
}
