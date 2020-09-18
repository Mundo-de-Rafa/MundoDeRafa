//
//  OnboardingView.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 18/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class HomeDefaultView: UIView {

    private let backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackgroundView() {
//        NSLayoutConstraint.activate([
//            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
//            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor),
//            backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor)
//        ])
    }
}
