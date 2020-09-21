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

    let backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let centerImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundView()
        setupCenterImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func setupCenterImage() {
        self.addSubview(centerImage)
        NSLayoutConstraint.activate([
            centerImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 146),
            centerImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            centerImage.heightAnchor.constraint(equalToConstant: CenterImageSizes.height.rawValue),
            centerImage.widthAnchor.constraint(equalToConstant: CenterImageSizes.width.rawValue)
        ])
    }
}
