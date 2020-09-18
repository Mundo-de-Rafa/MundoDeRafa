//
//  OnboardingView.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 18/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class OnboardingView: HomeDefaultView {
    
    lazy var centerLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá! Meu nome é Rafa. Venha comigo conhecer minha rotina!"
        label.font = UIFont(name: "BalsamiqSans-Regular", size: 28)
        label.textColor = .backgroundWhite
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        centerImage.image = UIImage(named: "rafa e chao")
        setupCenterLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCenterLabel() {
        self.addSubview(centerLabel)
        NSLayoutConstraint.activate([
            centerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            centerLabel.topAnchor.constraint(equalTo: centerImage.bottomAnchor, constant: 24),
            centerLabel.heightAnchor.constraint(equalToConstant: 80),
            centerLabel.widthAnchor.constraint(equalToConstant: 494)
        ])
    }
}
