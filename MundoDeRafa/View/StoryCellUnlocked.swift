//
//  StoryCell.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 18/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class StoryCellUnlocked: UICollectionViewCell {
    static let identifier: String = "CellUnlocked"
    let proportion : CGFloat = 1/2
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    
    var cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var cardLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.backgroundWhite
        label.font = UIFont.balsamiqB
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = label.font.withSize(30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var progressIndicator: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.tintColor = UIColor.primaryGreen
        progress.trackTintColor = UIColor.secondaryGreen
        progress.setProgress(0.5, animated: false)
        progress.layer.cornerRadius = 8
        progress.clipsToBounds = true
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    func setUpCardLabel() {
        self.contentView.addSubview(cardLabel)
        regularConstraints.append(contentsOf: [
            cardLabel.heightAnchor.constraint(equalToConstant: 86),
            cardLabel.widthAnchor.constraint(equalToConstant: 291),
            cardLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 427),
            cardLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 54)
        ])
        
        compactConstraints.append(contentsOf: [
            cardLabel.heightAnchor.constraint(equalToConstant: 86*proportion),
            cardLabel.widthAnchor.constraint(equalToConstant: 291*proportion),
            cardLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 427*proportion),
            cardLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 54*proportion)
        ])
    }
    func setUpCardImageUnlocked() {
        self.contentView.addSubview(cardImage)
        regularConstraints.append(contentsOf:[
            cardImage.heightAnchor.constraint(equalToConstant: 248),
            cardImage.widthAnchor.constraint(equalToConstant: 383),
            cardImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 154),
            cardImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8)
        ])
        compactConstraints.append(contentsOf:[
            cardImage.heightAnchor.constraint(equalToConstant: 248*proportion),
            cardImage.widthAnchor.constraint(equalToConstant: 383*proportion),
            cardImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 154*proportion),
            cardImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8*proportion)
        ])
    }
    
    func setUpProgressIndicator() {
        self.contentView.addSubview(progressIndicator)
        regularConstraints.append(contentsOf: [
            progressIndicator.heightAnchor.constraint(equalToConstant: 24),
            progressIndicator.widthAnchor.constraint(equalToConstant: 240),
            progressIndicator.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 536),
            progressIndicator.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 80)
        ])
        compactConstraints.append(contentsOf: [
            progressIndicator.heightAnchor.constraint(equalToConstant: 24*proportion),
            progressIndicator.widthAnchor.constraint(equalToConstant: 240*proportion),
            progressIndicator.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 536*proportion),
            progressIndicator.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 80*proportion)
        ])
        
    }
    
    func setViewLayout() {
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.activate(regularConstraints)
            NSLayoutConstraint.deactivate(compactConstraints)
        } else {
            cardLabel.font = cardLabel.font.withSize(30*proportion)
            progressIndicator.layer.cornerRadius = 8*proportion
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 16
        setUpCardImageUnlocked()
        self.backgroundColor = UIColor.secondaryPurple
        setUpCardLabel()
        setUpProgressIndicator()
        setViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
