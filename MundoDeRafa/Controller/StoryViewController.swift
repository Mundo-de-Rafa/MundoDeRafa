//
//  StoryViewController.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 20/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UICollectionViewDelegate {
    let cards : [Card] = [firstCard, cardLocked, cardLocked, cardLocked]
    
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
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch cards[indexPath.row].state {
        case .locked:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCellLocked.identifier, for: indexPath)
                    if let cell = cell as? StoryCellLocked {
                        cell.cardLabel.text = cards[indexPath.item].title
                        cell.cardImage.image = cards[indexPath.item].image
                        cell.progressIndicator.progress = cards[indexPath.item].progress
                    }
        
                    return cell
        case .unlocked:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCellUnlocked.identifier, for: indexPath)
            if let cell = cell as? StoryCellUnlocked {
                cell.cardLabel.text = cards[indexPath.item].title
                cell.cardImage.image = cards[indexPath.item].image
                cell.progressIndicator.progress = cards[indexPath.item].progress
                
            }
            return cell
        }
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
    
        if cards[indexPath.row].state == .locked {
            collectionView.cellForItem(at: indexPath)?.layer.add(shakingAnimation(), forKey: "transform")
            SoundHelper.playSound(resource: "unsuccessfulAction")
            
        } else {
            self.navigationController?.pushViewController(ScenesViewController(), animated: true)
        }
    }
}
