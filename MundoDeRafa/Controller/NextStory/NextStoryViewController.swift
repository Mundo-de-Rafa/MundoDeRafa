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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = NextStoryView(frame: UIScreen.main.bounds)
    }
}
