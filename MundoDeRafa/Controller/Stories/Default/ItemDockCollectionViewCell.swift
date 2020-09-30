//
//  ItemDockCollectionViewCell.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 29/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class ItemDockCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ItemDockCell"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundView = .none
        self.backgroundColor = .none
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height * 0.08),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: self.frame.height * -0.08),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.2)
        ])
    }
}
