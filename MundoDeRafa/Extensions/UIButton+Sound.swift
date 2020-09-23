//
//  UIButton+Sound.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 23/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

enum ButtonSoundType: String {
    case click = "clickButton"
    case finishScene = "finishScene"
    case finishTask = "finishTask"
}

var audioPlayer: AVAudioPlayer!

extension UIButton: AVAudioPlayerDelegate {
    func playSoundIfNeeded(of buttonType: ButtonSoundType) {
        guard UserDefaults.standard.bool(forKey: "isSoundOn") else { return }
        
        if let soundURL = Bundle.main.url(forResource: buttonType.rawValue, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer.delegate = self
                audioPlayer.prepareToPlay()
            } catch {
                print("Unable to play button sound \(error.localizedDescription)")
            }
            audioPlayer.play()
        } else {
            print("Unable to find audio file")
        }
    }
}
