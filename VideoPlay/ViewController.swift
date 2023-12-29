//
//  ViewController.swift
//  VideoPlay
//
//  Created by Arti on 29/12/23.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    // === This code is for to play url video coming from api
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    let videoURLString = "https://karmasu.co.in//uploads//splash_screen//16342201901322329663.mp4"
    @IBOutlet weak var videoContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
    }
        
        func setupVideoPlayer() {
            guard let videoURL = URL(string: videoURLString) else {
                print("Invalid video URL")
                return
            }
            
            player = AVPlayer(url: videoURL)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.videoGravity = .resizeAspectFill
            playerLayer?.frame = videoContainerView.bounds
            videoContainerView.layer.addSublayer(playerLayer!)
            
            // Add an observer to restart the video when it reaches the end
          //  NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: nil) { _ in
                self.player?.seek(to: CMTime.zero)
                self.player?.play()
          //  }
            
            // Start playing the video
            player?.play()
            
            
        }
        
        
        
    }
    


extension ViewController {
    
    // This code is for Video play in  view when video is imported in our file and play this code in view did load
   // import AVKit
    
    var player: AVPlayer?
    
            if let videoURL = Bundle.main.url(forResource: "pexels_videos_2759484 (2160p)", withExtension: "mp4") {
                       player = AVPlayer(url: videoURL)

                       let playerLayer = AVPlayerLayer(player: player)
                       playerLayer.frame = view.layer.bounds
                       view.layer.addSublayer(playerLayer)

                       player?.play()
                   }
    
}
