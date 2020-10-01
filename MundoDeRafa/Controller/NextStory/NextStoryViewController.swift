//
//  NextStoryViewController.swift
//  MundoDeRafa
//
//  Created by Beatriz Carlos on 18/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import UIKit
import AVFoundation

protocol NextStoryDelegate: class {
    func resetScene()
    func goToScene()
}

class NextStoryViewController: UIViewController {
    weak var delegate: NextStoryDelegate?
    var audioPlayer: AVAudioPlayer?
    lazy var bedroomView = self.view as? BedroomView

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
        delegate?.resetScene()
    }
    
    public func nextStory() {
        dismiss(animated: true, completion: nil)
        delegate?.goToScene()
    }
}
