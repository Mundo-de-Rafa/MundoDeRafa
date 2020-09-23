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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newView = StoryView(frame: UIScreen.main.bounds)
        newView.backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        newView.collectionView.delegate = self
        newView.collectionView.dataSource = self
        view = newView
    }
    
    @objc func backButtonAction(sender: UIButton) {
        print("a")
        //            let destination =
        //            present(destination, animated: true, completion: nil)
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
}
