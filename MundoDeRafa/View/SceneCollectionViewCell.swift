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

    lazy var isBlockedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var lockImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "locked")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
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
    
    func configIsBlockedView() {
        
        self.contentView.addSubview(isBlockedView)
        
        sharedConstraints.append(contentsOf: [
            isBlockedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            isBlockedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            isBlockedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            isBlockedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    func configLockImage() {
        
        self.contentView.addSubview(lockImage)
        
        sharedConstraints.append(contentsOf: [
            lockImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lockImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            lockImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.48),
            lockImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.27)
        ])
        
    }
    
    func configure(title: String, backgroundImage: UIImage, isComplete: Bool, isLocked: Bool) {
        
        if !isLocked {
            
            self.backgroundImage.image = backgroundImage
            self.title.text = title
            self.isBlockedView.isHidden = true
            self.lockImage.isHidden = true
            
        } else {
            
            self.backgroundImage.image = backgroundImage
            self.title.text = title
        
        }
        
        if isComplete {
            
            star.image = UIImage(named: "star") ?? UIImage()
            
        }
        
        configBackground()
        configPlaceHolder()
        configStar()
        configTitle()
        configIsBlockedView()
        configLockImage()
        
        NSLayoutConstraint.activate(sharedConstraints)
        setViewLayout()
    }
    
}
