//
//  ScenesViewController.swift
//  MundoDeRafa
//
//  Created by Felipe Santana on 21/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class ScenesViewController: UIViewController {
    
    lazy var scenesModels: [SceneModel] = []
    
    let bathRoomSceneCard = SceneModel(image: "card_bathroom", title: "Rafa Tomando Banho", isComplete: false, isBlocked: true)
    
    let bedRoomSceneCard = SceneModel(image: "card_bedroom", title: "Rafa se vestindo", isComplete: false, isBlocked: false)
    
    let kitchenSceneCard = SceneModel(image: "card_kitchen", title: "Café da manhã de Rafa", isComplete: false, isBlocked: true)
    
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
        scenesModels.append(contentsOf:[ bedRoomSceneCard, kitchenSceneCard])
        createSceneModelNewFile(data: scenesModels)
        let existsDirectory = FileController().directoryExists(with: "SceneModel.Json")
        print(existsDirectory)
    }
    
    func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
    
extension ScenesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        scenesModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SceneCollectionViewCell.identifier , for: indexPath)
        
        if let cell = cell as? SceneCollectionViewCell {

            cell.layer.cornerRadius = 12
            cell.layer.masksToBounds = true
            
            let sceneCard = scenesModels[indexPath.row]

            cell.configure(title: sceneCard.title, backgroundImage: UIImage(named: sceneCard.image) ?? UIImage(), isComplete: sceneCard.isComplete, isLocked: sceneCard.isBlocked)

        }
        
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if scenesModels[indexPath.row].isBlocked {
            
            print("Celula bloqueada")
            
        } else {
            
            SoundHelper.playSound(resource: "clickButton")
            navigationController?.pushViewController(StoryDefaultViewController(), animated: true)
            
        }
    }
}
