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
    
    func loadScenesCards() {
        
        if FileController().directoryExists(with: "SceneModel.Json") {

            guard let scenes = readSceneModelsFromFile() else { return }
            self.scenesModels = scenes
            
        } else {
            
            //let bathRoomSceneCard = SceneModel(image: "card_bathroom", title: "Rafa Tomando Banho", isComplete: false, isBlocked: true)
            
            let bedRoomSceneCard = SceneModel(image: "card_bedroom", title: "Rafa se vestindo", isComplete: false, isBlocked: false)
            
            let kitchenSceneCard = SceneModel(image: "card_kitchen", title: "Café da manhã de Rafa", isComplete: false, isBlocked: true)
            
            self.scenesModels.append(contentsOf:[ bedRoomSceneCard, kitchenSceneCard])
            createSceneModelNewFile(data: scenesModels)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadScenesCards()
        
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
    
    func shakingAnimation() -> CAKeyframeAnimation {
        // transform is a property of CAlayer which can rotate, translate and scale
        let transformAnim  = CAKeyframeAnimation(keyPath:"transform")
        //animation values from a position to another
        // CATransform3DMakeRotation(angle , x vector, y vector, z vector)
        // 2 values for initial position and final position
        transformAnim.values  = [NSValue(caTransform3D: CATransform3DMakeRotation(0.04, 0, 0, 1)),NSValue(caTransform3D: CATransform3DMakeRotation(-0.04 , 0, 0, 1))]
        transformAnim.duration  = 0.1
        transformAnim.repeatCount = 3
        return transformAnim
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if scenesModels[indexPath.row].isBlocked {
            
            collectionView.cellForItem(at: indexPath)?.layer.add(shakingAnimation(), forKey: "transform")
            SoundHelper.playSound(resource: "unsuccessfulAction")
            
        } else {
            
            SoundHelper.playSound(resource: "clickButton")
            navigationController?.pushViewController(StoryDefaultViewController(), animated: true)
            
        }
    }
}
