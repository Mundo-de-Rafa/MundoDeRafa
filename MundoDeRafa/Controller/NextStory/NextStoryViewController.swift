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
    }
    
    override func loadView() {
        let nextStoryView = NextStoryView()
        nextStoryView.viewController = self
        view = nextStoryView
    }
    
    public func bAction() {
        dismiss(animated: true, completion: nil)
    }
}
