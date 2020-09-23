//
//  OnboardingView.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 18/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

enum CenterImageSizes: CGFloat {
    case height = 320
    case width = 420
}

class HomeDefaultView: UIView {

    var viewController: HomeDefaultViewController?
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 24
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let centerImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let actionButton: RoundButton = {
        let button = RoundButton()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.backgroundColor = .backgroundWhite
        button.titleLabel?.font = UIFont.balsamiqB?.withSize(UIScreen.main.bounds.height * 0.036)
        button.setTitleColor(.primaryGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundView()
        setupStackView()
        setupStackSubviews()
        setupActionButton()
        setupCenterImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCenterImage(with image: UIImage?) {
        centerImage.image = image
    }
    
    func setButtonText(with text: String) {
        actionButton.setTitle(text, for: .normal)
    }
    
    @objc func didTapButton() {
        viewController?.didTapButton()
        actionButton.playSoundIfNeeded(of: .click)
    }
    
    func setupBackgroundView() {
        self.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    func setupStackView() {
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
    }
    
    func setupStackSubviews() {
        stackView.addArrangedSubview(centerImage)
        stackView.addArrangedSubview(actionButton)
    }
    
    func setupActionButton() {
        NSLayoutConstraint.activate([
            actionButton.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.12),
            actionButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.5)
        ])
    }
    
    func setupCenterImage() {
        centerImage.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    }
}
