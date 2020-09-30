//
//  StoryDefaultViewController.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 24/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class SceneDefaultViewController: UIViewController {

    var elements = [DockItem(name: "shirt"), DockItem(name: "shoes"), DockItem(name: "pants")]
    
    lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pause_button"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didTapPauseButton), for: .touchUpInside)
        return button
    }()
    
    lazy var instructionsLabel: PaddingLabel = {
        let label = PaddingLabel(withInsets: 8, 8, 24, 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.balsamiqB?.withSize(UIScreen.main.bounds.height * 0.04)
        label.backgroundColor = UIColor.backgroundWhite.withAlphaComponent(0.9)
        label.textColor = .primaryPurple
        label.textAlignment = .center
        label.layer.cornerRadius = UIScreen.main.bounds.height/24
        label.layer.masksToBounds = true
        label.numberOfLines = -1
        return label
    }()
    
    lazy var itemsDock: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 16
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isScrollEnabled = false
        collection.backgroundColor = UIColor.backgroundWhite.withAlphaComponent(0.9)
        collection.layer.cornerRadius = 24
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dragInteractionEnabled = true
        collection.register(ItemDockCollectionViewCell.self, forCellWithReuseIdentifier: ItemDockCollectionViewCell.identifier)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondaryPurple
        itemsDock.delegate = self
        itemsDock.dataSource = self
        itemsDock.dragDelegate = self
        setupPauseButton()
        setupInstructionsLabel()
        setupItemsDock()
    }
    
    func win() {
        navigationController?.present(NextStoryViewController(), animated: true, completion: nil)
    }
    
    @objc func didTapPauseButton() {
        
    }
    
    func showInstructionsLabel(with text: String, for time: DispatchTime) {
        instructionsLabel.text = text
        instructionsLabel.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.instructionsLabel.alpha = 1
        }, completion: {_ in
            DispatchQueue.main.asyncAfter(deadline: time) {
                self.hideInstructionsLabel()
                
            }
        })
    }
    
    func hideInstructionsLabel() {
        UIView.animate(withDuration: 1, animations: {
            self.instructionsLabel.alpha = 0
        }, completion: { _ in self.instructionsLabel.isHidden = true })
    }
    
    private func setupPauseButton() {
        view.addSubview(pauseButton)
        NSLayoutConstraint.activate([
            pauseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            pauseButton.widthAnchor.constraint(equalTo: pauseButton.heightAnchor),
            pauseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height * 0.02),
            pauseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: UIScreen.main.bounds.height * -0.02)
        ])
    }
    
    private func setupInstructionsLabel() {
        view.addSubview(instructionsLabel)
        NSLayoutConstraint.activate([
            instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height * 0.08),
            instructionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instructionsLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            instructionsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        instructionsLabel.alpha = 0
        instructionsLabel.isHidden = true
    }
    
    private func setupItemsDock() {
        itemsDock.dragInteractionEnabled = true
        view.addSubview(itemsDock)
        NSLayoutConstraint.activate([
            itemsDock.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemsDock.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: UIScreen.main.bounds.height * -0.08),
            itemsDock.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16),
            itemsDock.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
    
}

extension SceneDefaultViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemDockCollectionViewCell.identifier, for: indexPath)
                as? ItemDockCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.image = UIImage(named: elements[indexPath.row].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = itemsDock.frame.height
        let width = itemsDock.frame.width/CGFloat(elements.count)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

extension SceneDefaultViewController: UICollectionViewDragDelegate {
    
      func dragItems(for indexPath: IndexPath) -> [UIDragItem] {
        let item = elements[indexPath.row]
        let itemProvider = NSItemProvider(object: item.name as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
      }
    
    func collectionView(_ collectionView: UICollectionView, dragSessionWillBegin session: UIDragSession) {
        UIView.animate(withDuration: 0.1, animations: {
            self.itemsDock.alpha = 0
        }, completion: { _ in
            self.itemsDock.isHidden = true
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: UIDragSession) {
        self.itemsDock.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.itemsDock.alpha = 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return dragItems(for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, dragPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        let previewParameters = UIDragPreviewParameters()
        
        if #available(iOS 14.0, *) {
            previewParameters.shadowPath = UIBezierPath()
        }
        previewParameters.backgroundColor = UIColor.clear // Transparent background
        return previewParameters
    }
}
