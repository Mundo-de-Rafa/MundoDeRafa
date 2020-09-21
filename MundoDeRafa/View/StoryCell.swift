//
//  StoryCell.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 18/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class StoryCell: UICollectionViewCell {
    static let identifier: String = "Cell"
    
    var cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var cardLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.backgroundWhite
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
        NSLayoutConstraint.activate([
            cardLabel.heightAnchor.constraint(equalToConstant: 86),
            cardLabel.widthAnchor.constraint(equalToConstant: 291),
            cardLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 427),
            cardLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 54)
        ])
    }
    func setUpCardImage() {
        self.contentView.addSubview(cardImage)
        NSLayoutConstraint.activate([
            cardImage.heightAnchor.constraint(equalToConstant: 248),
            cardImage.widthAnchor.constraint(equalToConstant: 383),
            cardImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 154),
            cardImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8)
        ])
    }
    
    func setUpProgressIndicator() {
        self.contentView.addSubview(progressIndicator)
        NSLayoutConstraint.activate([
            progressIndicator.heightAnchor.constraint(equalToConstant: 24),
            progressIndicator.widthAnchor.constraint(equalToConstant: 240),
            progressIndicator.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 536),
            progressIndicator.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 80)
        ])
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.secondaryPurple
        self.layer.cornerRadius = 16
        setUpCardLabel()
        setUpCardImage()
        setUpProgressIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
