//
//  AudioVC.swift
//  Spotify Search
//
//  Created by Kyzyl Mari on 12/6/18.
//  Copyright © 2018 Kyzyl Atienza. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class AudioVC: UIViewController {
    
    var image = UIImage()
    var mainSongTitle = String()
    var mainPreviewURL = String()
    
    
    @IBOutlet var playPauseButton: UIButton!
    
    @IBOutlet var background: UIImageView!
    
    @IBOutlet var mainImageView: UIImageView!
    
    
    @IBOutlet var songTitle: UILabel!
    
    override func viewDidLoad() {
        
        songTitle.text = mainSongTitle
        
        background.image = image
        
        mainImageView.image = image
        
        downloadFileFromURL(url: URL(string: mainPreviewURL)!)
        
        playPauseButton.setTitle("Pause", for: .normal)
        
        
    }
    func downloadFileFromURL(url: URL){
        var downloadTask = URLSessionDownloadTask()
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: {
            customURL, response, error in
            
            self.play(url: customURL!)
            
        })
        
        downloadTask.resume()
        
    }
    
    
    func play(url: URL) {
        do {
        player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        }
        catch{
            print(error)
            
        }
        
    }
    
    
    @IBAction func pausePlay(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playPauseButton.setTitle("Play", for: .normal)
        }
        else{
           player.play()
            playPauseButton.setTitle("Pause", for: .normal)
            
        }
    }
    
    
}
