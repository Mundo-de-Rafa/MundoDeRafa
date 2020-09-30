//
//  KitchenSceneViewController.swift
//  MundoDeRafa
//
//  Created by Beatriz Carlos on 25/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit

class KitchenSceneViewController: UIViewController {
    lazy var viewBackground: KitchenSceneView = {
        let view = KitchenSceneView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewBackground
        viewBackground.setBackgroundImage()
        self.navigationController?.isNavigationBarHidden = true
    }
}
//<<<<<<< HEAD
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//=======
//>>>>>>> develop
//}
