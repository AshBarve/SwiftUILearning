//
//  AudioPlayer.swift
//  SwiftUI-SecondApp
//
//  Created by Ashish Barve on 02/10/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(soundName: String, type: String) {
    
    if let path = Bundle.main.path(forResource: soundName, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Cannot play this sound file")
        }
    }
}
