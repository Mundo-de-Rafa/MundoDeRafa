//
//  StoryViewController.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 20/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UICollectionViewDelegate {
    let backgroundView: UIImageView = {
        let backView = UIImageView()
        backView.image = UIImage(named: "Background")
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
        collectionView.backgroundView = backgroundView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundView()
        setUpCollectionView()
    }
    
    func setUpBackgroundView() {
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setUpCollectionView() {
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
    }
    
}
extension StoryViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath)
        
        if let cell = cell as? StoryCell {
            cell.cardLabel.text = "Rafa se preparando para escola"
            cell.cardImage.image = UIImage(named: "rafa_at_home")
        }
        
        return cell
        
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellHeightConstant: CGFloat = 600
        let cellWidthConstant: CGFloat = 400
        layout.sectionInset = UIEdgeInsets(top: 138,
                                           left: 88,
                                           bottom: 0,
                                           right: 72)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 42
        layout.itemSize = CGSize(width:cellWidthConstant , height: cellHeightConstant)
        
        return layout
    }
    
}
