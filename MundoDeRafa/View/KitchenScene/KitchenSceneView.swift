//
//  KitchenSceneView.swift
//  MundoDeRafa
//
//  Created by Beatriz Carlos on 25/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class KitchenSceneView: UIView {
    var compactConstraints: [NSLayoutConstraint] = []
    var regularConstraints: [NSLayoutConstraint] = []
    var sharedConstraints: [NSLayoutConstraint] = []
    
    lazy var viewBackground : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Kitchen Far Copy 3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var cerealBowl: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tigela_cereal_lado")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pause_button"), for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        setupConstants()
        setLayoutTrait(traitCollection: UIScreen.main.traitCollection)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayoutTrait(traitCollection:UITraitCollection) {
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
        } else {
            viewBackground.image = UIImage(named: "card_kitchen_iphone")
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        }
    }
    
    func setBackgroundImage() {
        viewBackground.image = UIImage(named: "Kitchen Close Copy 2")
        cerealBowl.image = UIImage(named: "tigela_cereal_cima")
        
        regularConstraints[4] = cerealBowl.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        NSLayoutConstraint.activate(regularConstraints)
        
//        compactConstraints[5] = cerealBowl.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 100)
//        NSLayoutConstraint.activate(compactConstraints)
    }
    
    private func setupConstants() {
        self.insertSubview(viewBackground, at: 0)
        self.addSubview(cerealBowl)
        self.addSubview(pauseButton)
        // Iphone
        compactConstraints.append(contentsOf: [
            viewBackground.topAnchor.constraint(equalTo: self.topAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            cerealBowl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 60),
            cerealBowl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            pauseButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            pauseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
        
        // Ipad
        regularConstraints.append(contentsOf: [
            viewBackground.topAnchor.constraint(equalTo: self.topAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            cerealBowl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 150),
            cerealBowl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            pauseButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            pauseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
