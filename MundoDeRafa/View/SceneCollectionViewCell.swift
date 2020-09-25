//
//  SceneCollectionViewCell.swift
//  MundoDeRafa
//
//  Created by Felipe Santana on 22/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

enum SceneState {
    case locked
    case unlocked
}

class SceneCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SceneCollectionViewCell"
    let proportion: CGFloat = 1/2
    
    private var sharedConstraints: [NSLayoutConstraint] = []
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var titlePlaceHolder: UIView = {
        let placeHolder = UIView()
        placeHolder.backgroundColor = UIColor.backgroundWhite
        placeHolder.translatesAutoresizingMaskIntoConstraints = false
        
        return placeHolder
    }()
    
    lazy var title: UILabel = {
        let titulo = UILabel()
        titulo.textColor = UIColor.primaryGreen
        titulo.font = UIFont.balsamiqB?.withSize(32)
        titulo.numberOfLines = 0
        titulo.adjustsFontSizeToFitWidth = true
        titulo.translatesAutoresizingMaskIntoConstraints = false
        
        return titulo
    }()
    
    lazy var star: UIImageView = {
        let star = UIImageView()
        star.translatesAutoresizingMaskIntoConstraints = false
        
        return star
    }()
    
    lazy var complete = Bool()
    
    func setViewLayout() {
        
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.activate(regularConstraints)
            NSLayoutConstraint.deactivate(compactConstraints)
        } else {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
            title.font = UIFont.balsamiqB?.withSize(24)
        }
        
    }
    
    func configBackground() {
        
        contentView.addSubview(backgroundImage)
        
        sharedConstraints.append(contentsOf:[
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configPlaceHolder() {
        
        contentView.addSubview(titlePlaceHolder)
        
        sharedConstraints.append(contentsOf: [
            titlePlaceHolder.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.22),
            titlePlaceHolder.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor),
            titlePlaceHolder.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -1),
            titlePlaceHolder.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor)
        ])
        
    }
    
    func configStar() {
        
        self.contentView.addSubview(star)
        
        regularConstraints.append(contentsOf: [
            star.centerYAnchor.constraint(equalTo: titlePlaceHolder.centerYAnchor),
            star.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            star.widthAnchor.constraint(lessThanOrEqualToConstant: 48),
            star.heightAnchor.constraint(lessThanOrEqualToConstant: 48)
        ])
        
        compactConstraints.append(contentsOf: [
            
            star.centerYAnchor.constraint(equalTo: titlePlaceHolder.centerYAnchor),
            star.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24 * proportion),
            star.widthAnchor.constraint(lessThanOrEqualToConstant: 48 * proportion),
            star.heightAnchor.constraint(lessThanOrEqualToConstant: 48 * proportion)
        ])
        
    }
    
    func configTitle() {
        
        self.contentView.addSubview(title)
        
        regularConstraints.append(contentsOf: [
            title.centerYAnchor.constraint(equalTo: titlePlaceHolder.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            title.trailingAnchor.constraint(equalTo: star.leadingAnchor, constant: -136)
        ])
        
        compactConstraints.append(contentsOf: [
            title.centerYAnchor.constraint(equalTo: titlePlaceHolder.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32 * proportion),
            title.trailingAnchor.constraint(equalTo: star.leadingAnchor, constant: -136 * proportion)            
        ])
        
    }
    
    func configure(title: String, backgroundImage: UIImage, locked: SceneState, complete: Bool) {
        
        switch locked {
        case .locked:
            self.backgroundImage.image = UIImage(named: "locked") ?? UIImage()
            
            self.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        case .unlocked:
            self.backgroundImage.image = backgroundImage
            self.title.text = title
        }
        
        if complete {
            
            star.image = UIImage(named: "star") ?? UIImage()
            
        }
        configBackground()
        configPlaceHolder()
        configStar()
        configTitle()
        
        NSLayoutConstraint.activate(sharedConstraints)
        setViewLayout()
    }
    
}
