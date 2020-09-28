//
//  BedroomViewController.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 24/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class BedroomViewController: UIViewController {

    override func loadView() {
        let bedroomView = BedroomView()
        bedroomView.bedroomViewController = self
        view = bedroomView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
    }
}
