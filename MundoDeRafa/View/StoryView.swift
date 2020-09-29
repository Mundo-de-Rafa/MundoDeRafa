//
//  StoryView.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 23/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation
import UIKit

enum ViewLayout {
    case iPhone
    case iPad
}

enum CellConstants {
    static let cellHeightConstant: CGFloat = 600
    static let cellWidthConstant: CGFloat = 400
    static let insetTop: CGFloat = 138
    static let insetLeft: CGFloat = 88
    static let insetBotton: CGFloat = 0
    static let insetRight: CGFloat = 72
    static let minimumLineSpacing: CGFloat = 42
}

class StoryView: UIView {

    var viewController: StoryViewController?
    var viewLayout = ViewLayout.iPad
    let proportion : CGFloat = 1/2
    let buttonProportion: CGFloat = 15/10
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    private var sharedConstraints: [NSLayoutConstraint] = []

    let backgroundView: UIImageView = {
        let backView = UIImageView()
        backView.image = UIImage(named: "Background")
        backView.contentMode = .scaleAspectFill
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back_button"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(StoryCellUnlocked.self, forCellWithReuseIdentifier: StoryCellUnlocked.identifier)
        collectionView.register(StoryCellLocked.self, forCellWithReuseIdentifier: StoryCellLocked.identifier)
        collectionView.backgroundView = backgroundView
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewLayout()
        setUpBackgroundView()
        setUpCollectionView()
        setUpButton()
        NSLayoutConstraint.activate(sharedConstraints)
        // Captures the current traitCollection and sends it to the layoutTrait method.
        setLayoutTrait(traitCollection: UIScreen.main.traitCollection)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapBackButton() {
        viewController?.backButtonAction()
        backButton.playSoundIfNeeded(of: .click)
    }
    
    func setUpBackgroundView() {
        self.addSubview(backgroundView)
        sharedConstraints.append(contentsOf: [
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setUpButton() {
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
        self.addSubview(collectionView)
        sharedConstraints.append(contentsOf: [
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
}

extension StoryView {

    private func collectionViewLayout() -> UICollectionViewLayout {
        let flowLayout = UICollectionViewFlowLayout()
        if viewLayout == ViewLayout.iPad {
            flowLayout.minimumLineSpacing = CellConstants.minimumLineSpacing
            flowLayout.scrollDirection = .horizontal
            flowLayout.sectionInset = UIEdgeInsets(
                top: CellConstants.insetTop,
                left: CellConstants.insetLeft,
                bottom: CellConstants.insetBotton,
                right: CellConstants.insetRight)
            
            flowLayout.itemSize = CGSize(width: CellConstants.cellWidthConstant , height: CellConstants.cellHeightConstant)
            return flowLayout
            
        } else {
            flowLayout.minimumLineSpacing = CellConstants.minimumLineSpacing*proportion
            flowLayout.scrollDirection = .horizontal
            flowLayout.sectionInset = UIEdgeInsets(
                top: CellConstants.insetTop*proportion,
                left: CellConstants.insetLeft*proportion,
                bottom: CellConstants.insetBotton,
                right: CellConstants.insetRight*proportion)
            
            flowLayout.itemSize = CGSize(width: CellConstants.cellWidthConstant*proportion , height: CellConstants.cellHeightConstant*proportion)
            return flowLayout
        }
        
    }
    
}
