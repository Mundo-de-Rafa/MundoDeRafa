//
//  ScenesViewController.swift
//  MundoDeRafa
//
//  Created by Felipe Santana on 21/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class ScenesViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func loadView() {
        let sceneView = SceneView()
        sceneView.viewController = self
        sceneView.sceneCollectionView.delegate = self
        sceneView.sceneCollectionView.dataSource = self
        view = sceneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
    
extension ScenesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SceneCollectionViewCell.identifier , for: indexPath)
        
        if let cell = cell as? SceneCollectionViewCell {

            cell.layer.cornerRadius = 12
            cell.layer.masksToBounds = true

            cell.configure(title: "Rafa Tomando Banho", backgroundImage: UIImage(named: "card_bathroom") ?? UIImage(), locked: .unlocked, complete: true)

        }
        
        return cell
    }
        
}
