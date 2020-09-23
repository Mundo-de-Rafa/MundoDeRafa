//
//  ScenesViewController.swift
//  MundoDeRafa
//
//  Created by Felipe Santana on 21/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class ScenesViewController: UIViewController {

    let progress = 10
    let scenes = "Adicionar scenes aqui"
    let progressBarBackground = UIView()
    let progressBarForeground = UIView()
    let progressPorcentage = UILabel()
    let backgroundImage = UIImageView()
    let backButton = UIButton()
    let scenesCollection : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 600, height: 400)
        layout.minimumLineSpacing = 72
        layout.sectionInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scenesCollection.delegate = self
        scenesCollection.dataSource = self
        scenesCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        scenesCollection.register(SceneCollectionViewCell.self, forCellWithReuseIdentifier: SceneCollectionViewCell.identifier)
        
        configBackground()
        configButton()
        configureBackgroundProgressBar()
        configureForegroundProgessBar()
        configurePorcentage()
        setCollectionConstraints()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func configButton() {
        
        view.addSubview(backButton)
        
        backButton.setImage(UIImage(named: "back_button"), for: .normal)
        
        setBackButtonContraints()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        backButton.layer.cornerRadius =  0.5 * backButton.bounds.size.width
//    }
    
    func configBackground() {
        
        view.addSubview(backgroundImage)
        
        backgroundImage.image = UIImage(named: "Background")
        
        backgroundImage.contentMode = .scaleAspectFill
        
        setBackgroundImageConstraints()
    }
    
    func setBackgroundImageConstraints() {
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    func setBackButtonContraints() {
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            
            backButton.heightAnchor.constraint(equalToConstant: 64),
            
            backButton.widthAnchor.constraint(equalToConstant: 64)
            
        ])
        
    }
    
    func configureBackgroundProgressBar() {
        
        view.addSubview(progressBarBackground)
        
        progressBarBackground.backgroundColor = UIColor.primaryGreen
        
        progressBarBackground.layer.cornerRadius = 8
            
        progressBarBackground.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressBarBackground.topAnchor.constraint(equalTo: view.topAnchor,constant: 40),
            
            progressBarBackground.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 104),
            
            progressBarBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -216),
            
            progressBarBackground.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    func configureForegroundProgessBar() {
        
        view.addSubview(progressBarForeground)
        
        progressBarForeground.backgroundColor = UIColor.progressBarGreen
        
        progressBarForeground.layer.cornerRadius = 8
        
        progressBarForeground.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        progressBarForeground.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressBarForeground.topAnchor.constraint(equalTo:view.topAnchor, constant: 40),
            
            progressBarForeground.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 104),
            
            progressBarForeground.widthAnchor.constraint(equalTo: progressBarBackground.widthAnchor, multiplier: CGFloat(Double(progress)/100.0)),
            
            progressBarForeground.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configurePorcentage() {
        
        view.addSubview(progressPorcentage)
        
        progressPorcentage.numberOfLines = 0
        progressPorcentage.adjustsFontSizeToFitWidth = true
        progressPorcentage.font = UIFont(name: "BalsamiqSans-Bold", size: 32)
        progressPorcentage.text = "\(progress)%"
        progressPorcentage.textColor = UIColor.backgroundWhite
        
        progressPorcentage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressPorcentage.centerYAnchor.constraint(equalTo: progressBarBackground.centerYAnchor),
            
            progressPorcentage.leadingAnchor.constraint(equalTo: progressBarBackground.trailingAnchor, constant: 32)
        ])
        
    }
    
    func setCollectionConstraints() {
        
        view.addSubview(scenesCollection)
        
        scenesCollection.translatesAutoresizingMaskIntoConstraints = false
        
        scenesCollection.showsHorizontalScrollIndicator = false
        
        scenesCollection.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            scenesCollection.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 152),
            
            scenesCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            scenesCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scenesCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160)
        ])
        
    }
    
}

extension ScenesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = scenesCollection.dequeueReusableCell(withReuseIdentifier: SceneCollectionViewCell.identifier , for: indexPath) as? SceneCollectionViewCell
        
        cell?.layer.cornerRadius = 12
        cell?.layer.masksToBounds = true
            
        cell?.configure(title: "Rafa Tomando Banho", backgroundImage: UIImage(named: "card_bathroom") ?? UIImage(), complete: true)
        
        return cell ?? UICollectionViewCell()
    }
        
}
