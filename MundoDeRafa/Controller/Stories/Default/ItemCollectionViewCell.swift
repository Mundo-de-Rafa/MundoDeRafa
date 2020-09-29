//
//  ItemCollectionViewCell.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 25/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    lazy var image: UIImageView = { [ weak self ] in
        guard let this = self else { return UIImageView() }
        let imageView = UIImageView()
        imageView.frame = this.frame
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(withName name: String) {
        image.image = UIImage(named: name)
    }
}
