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
    
    lazy var dottedShoes: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shoes_dotted")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var shoes: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shoes_rafa")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var shirt: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shirt_rafa")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var dottedShirt: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shirt_dotted")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var pants: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pants_rafa")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var dottedPants: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pants_dotted")
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
            rafaImage.widthAnchor.constraint(equalToConstant: 245*proportion),
            rafaImage.heightAnchor.constraint(equalToConstant: 591*proportion),
            rafaImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 186*0.6),
            rafaImage.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 375)
        ])
        
        regularConstraints.append(contentsOf: [
            rafaImage.widthAnchor.constraint(equalToConstant: 245),
            rafaImage.heightAnchor.constraint(equalToConstant: 591),
            rafaImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 186),
            rafaImage.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 417)
        ])
    }
    
    func setShoes() {
        
        self.addSubview(shoes)
        regularConstraints.append(contentsOf: [
            shoes.widthAnchor.constraint(equalToConstant: 138),
            shoes.heightAnchor.constraint(equalToConstant: 30),
            shoes.bottomAnchor.constraint(equalTo: rafaImage.bottomAnchor, constant: 0),
            shoes.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 472)
            
        ])
        
        compactConstraints.append(contentsOf: [
            shoes.widthAnchor.constraint(equalToConstant: 138*proportion),
            shoes.heightAnchor.constraint(equalToConstant: 30*proportion),
            shoes.topAnchor.constraint(equalTo: self.topAnchor, constant: 395),
            shoes.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 402.5)
            
        ])
    }
    
    func setDottedShoes() {
        self.addSubview(dottedShoes)
        regularConstraints.append(contentsOf: [
            dottedShoes.widthAnchor.constraint(equalToConstant: 138),
            dottedShoes.heightAnchor.constraint(equalToConstant: 30),
            dottedShoes.topAnchor.constraint(equalTo: self.topAnchor, constant: 750),
            dottedShoes.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 472)
            
        ])
        compactConstraints.append(contentsOf: [
            dottedShoes.widthAnchor.constraint(equalToConstant: 138*proportion),
            dottedShoes.heightAnchor.constraint(equalToConstant: 30*proportion),
            dottedShoes.topAnchor.constraint(equalTo: self.topAnchor, constant: 395),
            dottedShoes.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 402.5)
            
        ])
        
    }
    
    func setPants() {
        self.addSubview(pants)
        regularConstraints.append(contentsOf: [
            
            pants.widthAnchor.constraint(equalToConstant: 132),
            pants.heightAnchor.constraint(equalToConstant: 180),
            pants.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -75 ),
            pants.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 472)
        ])
        
        compactConstraints.append(contentsOf: [
            pants.widthAnchor.constraint(equalToConstant: 132*proportion),
            pants.heightAnchor.constraint(equalToConstant: 180*proportion),
            pants.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -27 ),
            pants.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 402.5)
        ])
    }
    
    func setDottedPants() {
        self.addSubview(dottedPants)
        regularConstraints.append(contentsOf: [
            dottedPants.widthAnchor.constraint(equalToConstant: 132),
            dottedPants.heightAnchor.constraint(equalToConstant: 180),
            dottedPants.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -75 ),
            dottedPants.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 472)
        ])
        
        compactConstraints.append(contentsOf: [
            dottedPants.widthAnchor.constraint(equalToConstant: 132*proportion),
            dottedPants.heightAnchor.constraint(equalToConstant: 180*proportion),
            dottedPants.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -27 ),
            dottedPants.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 402.5)
        ])
        
    }
    
    func setShirt() {
        shirt.isHidden = true
        
        self.addSubview(shirt)
        regularConstraints.append(contentsOf: [
            shirt.widthAnchor.constraint(equalToConstant: 177),
            shirt.heightAnchor.constraint(equalToConstant: 155),
            shirt.topAnchor.constraint(equalTo: self.topAnchor, constant: 405 ),
            shirt.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 453)
            
        ])
        
        compactConstraints.append(contentsOf: [
            shirt.widthAnchor.constraint(equalToConstant: 177*proportion),
            shirt.heightAnchor.constraint(equalToConstant: 155*proportion),
            shirt.topAnchor.constraint(equalTo: self.topAnchor, constant: 222 ),
            shirt.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 393)
            
        ])
    }
    
    func setDottedShirt() {
        self.addSubview(dottedShirt)
        regularConstraints.append(contentsOf: [
            dottedShirt.widthAnchor.constraint(equalToConstant: 177),
            dottedShirt.heightAnchor.constraint(equalToConstant: 155),
            dottedShirt.topAnchor.constraint(equalTo: self.topAnchor, constant: 405 ),
            dottedShirt.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 453)
            
        ])
        
        compactConstraints.append(contentsOf: [
            dottedShirt.widthAnchor.constraint(equalToConstant: 177*proportion),
            dottedShirt.heightAnchor.constraint(equalToConstant: 155*proportion),
            dottedShirt.topAnchor.constraint(equalTo: self.topAnchor, constant: 222 ),
            dottedShirt.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 393)
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
        setDottedShoes()
        setDottedPants()
        setDottedShirt()
        setShoes()
        setPants()
        setShirt()
        NSLayoutConstraint.activate(sharedConstraints)
        setLayoutTrait(traitCollection: UIScreen.main.traitCollection)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
