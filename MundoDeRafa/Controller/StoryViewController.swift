//
//  StoryViewController.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 20/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    let backgroundView: UIImageView = {
        let backView = UIImageView()
        backView.image = UIImage(named: "Background")
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundView()
    }
    
    func setUpBackgroundView() {
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    
}
