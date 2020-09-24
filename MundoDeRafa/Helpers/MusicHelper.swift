//
//  MusicHelper.swift
//  MundoDeRafa
//
//  Created by Albert Rayneer on 23/09/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation
import AVFoundation

class MusicHelper {
    static let shared = MusicHelper()
    var audioPlayer: AVAudioPlayer!
    
    func playBackgroundMusicIfNeeded() {
        if let musicURL = Bundle.main.url(forResource: "music", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: musicURL)
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
            } catch {
                print("Unable to play music: \(error.localizedDescription)")
            }
        } else {
            print("Unable to find music file")
        }
        if UserDefaults.standard.bool(forKey: "isMusicOn") {
            playMusic()
        } else { return }
    }
    
    func playMusic() {
        audioPlayer.play()
    }
    
    func stopMusic() {
        audioPlayer.stop()
    }
}
