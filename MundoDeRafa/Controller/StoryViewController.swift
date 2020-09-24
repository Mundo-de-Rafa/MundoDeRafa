//
//  StoryViewController.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 20/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UICollectionViewDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        let storyView = StoryView()
        storyView.viewController = self
        storyView.collectionView.delegate = self
        storyView.collectionView.dataSource = self
        view = storyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension StoryViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath)
        
        if let cell = cell as? StoryCell {
            cell.cardState = .locked
            cell.cardLabel.text = "Bloqueado"
            cell.cardImage.image = UIImage(named: "locked")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(ScenesViewController(), animated: true)
    }
}
