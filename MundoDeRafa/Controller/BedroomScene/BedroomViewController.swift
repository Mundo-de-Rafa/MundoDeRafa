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

        let dropInteraction = UIDropInteraction(delegate: self)
        view.addInteraction(dropInteraction)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showInstructionsLabel(with: "Ajude o Rafa a se vestir! Arraste as peças de roupa para as partes do corpo corretas!", for: .now() + 6)
    }
    
}

// MARK: Items Dock Drop Delegate
extension BedroomViewController: UIDropInteractionDelegate {
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: String.self) { (dockItems) in
            if dockItems.contains("shirt") {
                if let view = self.view as? BedroomView {
                    if view.shirt.frame.contains(session.location(in: view)) {
                        view.shirt.isHidden = false
                        view.dottedShirt.isHidden = true
                    }
                }
            }
        }

    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidEnd session: UIDropSession) {
        
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        print(session.location(in: view))
        return UIDropProposal(operation: .move)
    }

}
