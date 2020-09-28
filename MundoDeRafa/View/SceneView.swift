//
//  SceneView.swift
//  MundoDeRafa
//
//  Created by Felipe Santana on 23/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation
import UIKit

enum CellConstantsScene {
    
}

class SceneView: UIView {
    
    var viewController: ScenesViewController?
    
    var viewLayout = ViewLayout.iPad
    let proportion: CGFloat = 1/2
    let buttonProportion: CGFloat = 15/10
    
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    private var sharedConstraints: [NSLayoutConstraint] = []
    
    let background: UIImageView = {
        
        let backgroundView = UIImageView()
        backgroundView.image = UIImage(named: "Background")
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        return backgroundView
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back_button"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.tintColor = UIColor.secondaryGreen
        progress.trackTintColor = UIColor.primaryGreen
        progress.setProgress(0.5/*progresso vai vir da controler*/, animated: false)
        progress.layer.cornerRadius = 8
        progress.clipsToBounds = true
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    var progressPorcentage: UILabel = {
        
        let porcentage = UILabel()
        porcentage.numberOfLines = 0
        porcentage.adjustsFontSizeToFitWidth = true
        porcentage.font = UIFont.balsamiqB?.withSize(32)
        porcentage.text = "50%" /*Essa porcentagem vem da controller, puxando do model*/
        porcentage.textColor = UIColor.backgroundWhite
        
        porcentage.translatesAutoresizingMaskIntoConstraints = false
        
        return porcentage
    }()
    
    lazy var sceneCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: sceneCollectionViewLayout())
        collectionView.register(SceneCollectionViewCell.self, forCellWithReuseIdentifier: SceneCollectionViewCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewLayout()
        setUpBackground()
        setUpCollectionView()
        setUpBackButton()
        setUpProgressBar()
        setUpProgressPorcentage()
        NSLayoutConstraint.activate(sharedConstraints)
        setLayoutTrait(traitCollection: UIScreen.main.traitCollection)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapBackButton() {
        viewController?.backButtonAction()
        backButton.playSoundIfNeeded(of: .click)
    }
    
    func setUpBackground() {
        self.addSubview(background)
        sharedConstraints.append(contentsOf: [
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.leftAnchor.constraint(equalTo: self.leftAnchor),
            background.rightAnchor.constraint(equalTo: self.rightAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setUpBackButton() {
        
        self.addSubview(backButton)
        regularConstraints.append(contentsOf: [
            backButton.widthAnchor.constraint(equalToConstant: 64),
            backButton.heightAnchor.constraint(equalToConstant: 64),
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 62)
        ])
        
        compactConstraints.append(contentsOf: [
            backButton.widthAnchor.constraint(equalToConstant: 64/buttonProportion),
                backButton.heightAnchor.constraint(equalToConstant: 64/buttonProportion),
                backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 32*proportion),
                backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 62*proportion)
        ])
    }
    
    func setUpProgressBar() {
        
        self.addSubview(progressBar)
        regularConstraints.append(contentsOf: [
            progressBar.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            progressBar.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 104),
            progressBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -216),
            progressBar.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        compactConstraints.append(contentsOf: [
            progressBar.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            progressBar.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 104 * proportion),
            progressBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -216 * proportion),
            progressBar.heightAnchor.constraint(equalToConstant: 40 * proportion)
        ])
        
    }
    
    func setUpProgressPorcentage() {
        
        self.addSubview(progressPorcentage)
        regularConstraints.append(contentsOf: [
            progressPorcentage.centerYAnchor.constraint(equalTo: progressBar.centerYAnchor),
            progressPorcentage.leadingAnchor.constraint(equalTo: progressBar.trailingAnchor, constant: 32)
        ])
        
        compactConstraints.append(contentsOf: [
            progressPorcentage.centerYAnchor.constraint(equalTo: progressBar.centerYAnchor),
            progressPorcentage.leadingAnchor.constraint(equalTo: progressBar.trailingAnchor, constant: 32 * proportion)
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
    
    func setUpCollectionView() {
        self.addSubview(sceneCollectionView)

        sharedConstraints.append(contentsOf: [
            sceneCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 72),
            sceneCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            sceneCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            sceneCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor/*, constant: -0.2 * self.bounds.height*/)
        ])
    }
    
}

extension SceneView {
    
    private func sceneCollectionViewLayout() -> UICollectionViewLayout {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        let cellHeightConstant: CGFloat = 500
        let cellWidthConstant: CGFloat = 1.5 * cellHeightConstant
        let insetTop: CGFloat = 0
        let insetLeft: CGFloat = 88
        let insetBottom: CGFloat = 0
        let insetRight: CGFloat = 72
        let minimumLineSpacing: CGFloat = 72
        
        if viewLayout == ViewLayout.iPad {
            
            flowLayout.minimumLineSpacing = minimumLineSpacing
            flowLayout.scrollDirection = .horizontal
            
            flowLayout.sectionInset = UIEdgeInsets(
                top: insetTop,
                left: insetLeft,
                bottom: insetBottom,
                right: insetRight)
            
            flowLayout.itemSize = CGSize(width: cellWidthConstant, height: cellHeightConstant)
            
            return flowLayout
            
        } else {
            
            flowLayout.minimumLineSpacing = minimumLineSpacing*proportion
            flowLayout.scrollDirection = .horizontal
            flowLayout.sectionInset = UIEdgeInsets(
                top: insetTop*proportion,
                left: insetLeft*proportion,
                bottom: insetBottom,
                right: insetRight*proportion)
            
            flowLayout.itemSize = CGSize(width: cellWidthConstant*proportion , height: cellHeightConstant*proportion)
            return flowLayout
            
        }
        
    }
}
