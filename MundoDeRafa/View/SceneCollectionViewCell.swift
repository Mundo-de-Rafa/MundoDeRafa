//
//  SceneCollectionViewCell.swift
//  MundoDeRafa
//
//  Created by Felipe Santana on 22/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class SceneCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SceneCollectionViewCell"
    
    var backgroundImage = UIImageView()
    var titlePlaceHolder = UIView()
    var title = UILabel()
    var star = UIImageView()
    var complete = Bool()
    
    func configure(title: String, backgroundImage: UIImage, complete: Bool) {
        
        self.backgroundImage.image = backgroundImage
        self.title.text = title
        
        if complete {
            
            star.image = UIImage(named: "star") ?? UIImage()
            
        }
        
        configBackground()
        configPlaceHolder()
        configStar()
        configTitle()
        
    }
    
    func configBackground() {
        
        contentView.addSubview(backgroundImage)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    func configPlaceHolder() {
        
        contentView.addSubview(titlePlaceHolder)
        
        titlePlaceHolder.backgroundColor = UIColor.backgroundWhite
        
        titlePlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titlePlaceHolder.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.22),
            titlePlaceHolder.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor),
            titlePlaceHolder.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -1),
            titlePlaceHolder.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor)
        ])
        
    }
    
    func configStar() {
        
        contentView.addSubview(star)
        
        star.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            star.topAnchor.constraint(greaterThanOrEqualTo: titlePlaceHolder.topAnchor, constant: 16),
            star.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            star.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            star.widthAnchor.constraint(lessThanOrEqualToConstant: 48),
            star.heightAnchor.constraint(lessThanOrEqualToConstant: 48)
        ])
        
    }
    
    func configTitle() {
        
        contentView.addSubview(title)
        
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        title.font = UIFont(name: "BalsamiqSans-Bold", size: 32)
        title.textColor = UIColor.primaryGreen
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: titlePlaceHolder.topAnchor, constant: 24),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            title.trailingAnchor.constraint(equalTo: star.leadingAnchor, constant: -136),
            title.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -24)
        ])
        
    }
    
}
