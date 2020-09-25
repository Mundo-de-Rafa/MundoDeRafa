//
//  RoomSceneView.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 24/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class BedroomView: UIView {
    var viewLayout = ViewLayout.iPad
    let proportion : CGFloat = 1/2
    var bedroomViewController: BedroomViewController?
    var compactConstraints: [NSLayoutConstraint] = []
    var regularConstraints: [NSLayoutConstraint] = []
    var sharedConstraints: [NSLayoutConstraint] = []
    
    lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bedroom_background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var rafaImage: UIView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rafa_no_clothes")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setBackgroundView() {
        self.addSubview(backgroundView)
        sharedConstraints.append(contentsOf: [
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    func setRafaImage() {
        self.addSubview(rafaImage)
        compactConstraints.append(contentsOf: [
            rafaImage.topAnchor.constraint(equalTo: self.topAnchor),
            rafaImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            rafaImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            rafaImage.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        
        regularConstraints.append(contentsOf: [
            rafaImage.widthAnchor.constraint(equalToConstant: 245),
            rafaImage.heightAnchor.constraint(equalToConstant: 591),
            rafaImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 186),
            rafaImage.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 417),
            rafaImage.bottomAnchor.constraint(equalTo: rafaImage.bottomAnchor, constant: 30)
        ])
        
    }
    
    func setLayoutTrait(traitCollection:UITraitCollection) {
        switch viewLayout {
        case .iPad:
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
        case .iPhone:
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        }
        
    }
    
    func setViewLayout() {
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular {
            viewLayout = ViewLayout.iPad
        } else {
            viewLayout = ViewLayout.iPhone
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewLayout()
        setBackgroundView()
        setRafaImage()
        NSLayoutConstraint.activate(sharedConstraints)
        setLayoutTrait(traitCollection: UIScreen.main.traitCollection)
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
