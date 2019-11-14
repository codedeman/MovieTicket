//
//  VideoDescriptionVC.swift
//  BookingApp
//
//  Created by Apple on 11/14/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideoDescriptionVC: UIViewController {

    @IBOutlet weak var bookBtn: UIButton(){
    
        
    }!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var playerVideo: YouTubePlayerView!
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           
       }
       
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let videoURL = URL(string: "https://www.youtube.com/watch?v=e82JHkkPw54") else { return }
        
        playerVideo.loadVideoURL(videoURL)
        
//        let player = AVPlayer(url: videoURL!)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        self.present(playerViewController, animated: true) {
//            playerViewController.player!.play()
//        }
        
        

    }
    
    
    
    @IBAction func bookButtonWasPressed(_ sender: Any) {
        
        
    }
    
    
   

   
}



