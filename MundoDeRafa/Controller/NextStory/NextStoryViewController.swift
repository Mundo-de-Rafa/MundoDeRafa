//
//  NextStoryViewController.swift
//  MundoDeRafa
//
//  Created by Beatriz Carlos on 18/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit
import AVFoundation

class NextStoryViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    
    lazy var viewNextstoryView : NextStoryView = {
        let view = NextStoryView(frame: UIScreen.main.bounds)
        return view
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewNextstoryView
    }
}

class StoryViewController: UIViewController, UICollectionViewDelegate {
    

     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // activate shared constraints
        NSLayoutConstraint.activate(sharedConstraints)
        // Captures the current traitCollection and sends it to the layoutTrait method.
        layoutTrait(traitCollection: UIScreen.main.traitCollection)
    }
    func layoutTrait(traitCollection:UITraitCollection) {
        // Ipad constraints
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
            
        }
        // Iphone constraints
        else {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        }
    }
}
