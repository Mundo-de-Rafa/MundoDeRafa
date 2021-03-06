//
//  BedroomViewController.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 24/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class BedroomViewController: SceneDefaultViewController {
    var viewsForElements: [String:UIImageView?]?
    var dottedViewsForElements: [String:UIImageView?]?
    lazy var bedroomView = self.view as? BedroomView

    override func loadView() {
        let bedroomView = BedroomView()
        bedroomView.bedroomViewController = self
        view = bedroomView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        viewsForElements = ["shirt": self.bedroomView?.shirt, "shoes": self.bedroomView?.shoes, "pants": self.bedroomView?.pants]
        dottedViewsForElements = ["shirt": self.bedroomView?.dottedShirt, "shoes": self.bedroomView?.dottedShoes, "pants": self.bedroomView?.dottedPants]
        
        let dropInteraction = UIDropInteraction(delegate: self)
        view.addInteraction(dropInteraction)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showInstructionsLabel(with: "Ajude o Rafa a se vestir! Segure e arraste as peças de roupa para as partes do corpo corretas!", for: .now() + 6)
    }
    
    private func unhide(element: String) {
        guard let view = viewsForElements?[element],
              let dottedView = dottedViewsForElements?[element] else { return }
        
        view!.isHidden = false
        dottedView!.isHidden = true
        
        verifyWinning()
    }
    
    private func verifyWinning() {
        var winCount = 0
        guard let views = dottedViewsForElements else { return }
        views.forEach { (_, view: UIImageView?) in
            winCount += view?.isHidden ?? false ? 1 : 0
        }
        
        if winCount == 3 {
            SoundHelper.playSound(resource: "finishScene")
            pauseButton.isHidden = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.hideDock()
                self.hideInstructionsLabel()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.win()
                self.updateScenes()
            
            }
        }
    }
    
    func updateScenes() {
        
        let bedRoomSceneCard = SceneModel(image: "card_bedroom", title: "Rafa se vestindo", isComplete: true, isBlocked: false)
        
        let kitchenSceneCard = SceneModel(image: "card_kitchen", title: "Café da manhã de Rafa", isComplete: false, isBlocked: true)
        
        var scenesModels: [SceneModel] = []
        scenesModels.append(contentsOf: [bedRoomSceneCard, kitchenSceneCard])
        
        updateSceneModelsDataFile(data: scenesModels)
        
    }
    
    override func resetScene() {
        super.resetScene()
        bedroomView?.pants.isHidden = true
        bedroomView?.shoes.isHidden = true
        bedroomView?.shirt.isHidden = true
        bedroomView?.dottedPants.isHidden = false
        bedroomView?.dottedShirt.isHidden = false
        bedroomView?.dottedShoes.isHidden = false
        showInstructionsLabel(with: "Ajude o Rafa a se vestir! Arraste as peças de roupa para as partes do corpo corretas!", for: .now() + 6)
    }
}

// MARK: Items Dock Drop Delegate
extension BedroomViewController: UIDropInteractionDelegate {
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        _ = session.loadObjects(ofClass: String.self) { (dockItems) in
            self.elements.forEach { (item) in
                if dockItems.contains(item.name) {
                    guard let itemView = self.viewsForElements?[item.name] else { return }
                    if itemView!.frame.contains(session.location(in: self.view)) {
                        self.unhide(element: item.name)
                    }
                }
            }
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .move)
    }
}
