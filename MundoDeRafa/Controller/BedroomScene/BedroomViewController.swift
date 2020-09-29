//
//  BedroomViewController.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 24/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class BedroomViewController: SceneDefaultViewController {

    override func loadView() {
        let bedroomView = BedroomView()
        bedroomView.bedroomViewController = self
        view = bedroomView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        itemsDock.dropDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showInstructionsLabel(with: "Ajude o Rafa a se vestir! Arraste as peças de roupa para as partes do corpo corretas!", for: .now() + 6)
    }
}

// MARK: Items Dock Drop Delegate
extension BedroomViewController: UICollectionViewDropDelegate {
    
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        print(session)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        //Fit clothes
        guard let bedroomView = view as? BedroomView else { return }
        print(coordinator.destinationIndexPath)
        
    }
    
}
