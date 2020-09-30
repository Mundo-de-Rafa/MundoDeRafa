//
//  SoundHelper.swift
//  MundoDeRafa
//
//  Created by Jhennyfer Rodrigues de Oliveira on 28/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation
import AVFoundation

class SoundHelper { 
    static func playSound(resource: String) {
        // keeps url and check bool sound is on
        guard let url = Bundle.main.url(forResource: resource, withExtension: "mp3"),
              UserDefaults.standard.bool(forKey: "isSoundOn") else { return }
        
        do {
            // shared instance return singleton instance
            // category could be record, playback: to play a sound, etc
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            // pass the url and type of file
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            // if audio player isnt null play the audio
            guard let newAudioPlayer = audioPlayer else { return }
            newAudioPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
