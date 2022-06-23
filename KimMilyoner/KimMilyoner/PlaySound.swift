//
//  PlaySound.swift
//  KimMilyoner
//
//  Created by Emre on 5.06.2022.
//

import Foundation
import AVFoundation

var player : AVAudioPlayer!

func playSound(soundName: String) {
    print("\(soundName).mp3 oynatıldı.")
    // Enabling sound to play while silent mode is on
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback)
    } catch {
        print(error.localizedDescription)
    }
    
    let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
    
    // Do nothing if url is empty
    guard url != nil else {
        return
    }
    
    do {
        // Play sound
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    } catch {
        print(error.localizedDescription)
    }
    
    
}
