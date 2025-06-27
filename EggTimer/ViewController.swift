//
//  ViewController.swift
//  Egg Timer
//
//  Created by Firebrand Dev on 23/05/2025.
//  Copyright © 2025 Firebrand Dev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var successStatus: UILabel!
    
    @IBOutlet var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalDuration: Float = 0.0
    var timer = Timer()
    var player: AVAudioPlayer!
 
    @IBAction func hardnerSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        var hardness = eggTimes[sender.currentTitle!]
        successStatus.text = sender.currentTitle!
        totalDuration = Float(hardness!)
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true ) {(Timer) in
            if hardness! > 0 {
//                print("\(hardness!) seconds.")
                let progress = (self.totalDuration - Float(hardness!)) / self.totalDuration
                self.progressBar.progress = progress
                hardness! -= 1
            } else if hardness! == 0 {
                self.progressBar.progress = 1.0
                self.playSound()
                self.successStatus.text = "DONE!"
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "bell", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }

}
