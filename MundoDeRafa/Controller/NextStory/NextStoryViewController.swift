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
        playSound()
    }
    
    override func loadView() {
        let nextStoryView = NextStoryView()
        nextStoryView.viewController = self
        view = nextStoryView
    }
    
    public func bAction() {
        print("djjh")
        dismiss(animated: true, completion: nil)
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "finishScene", withExtension: "mp3"),
              UserDefaults.standard.bool(forKey: "isSoundOn") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
