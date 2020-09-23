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
        label.font = UIFont.balsamicR?.withSize(UIScreen.main.bounds.height * 0.036)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .backgroundWhite
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCenterImage(with: UIImage(named: "rafa e chao"))
        setButtonText(with: "Próximo")
        setupCenterLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupStackSubviews() {
        super.setupStackSubviews()
        stackView.insertArrangedSubview(centerLabel, at: 1)
    }
    
    func setupCenterLabel() {
        NSLayoutConstraint.activate([
            centerLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
        ])
    }
}
