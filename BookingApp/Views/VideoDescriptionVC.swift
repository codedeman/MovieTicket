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

    @IBOutlet weak var bookBtn: UIButton?{
        didSet{
        
            self.bookBtn?.layer.cornerRadius = 20
        }
        
    }
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var playerVideo: YouTubePlayerView!
    
    
    
    

       
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        view.addSubview(navBar)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        do{
            
            if let videoURl = try? URL(string: "https://www.youtube.com/watch?v=e82JHkkPw54"){
                
                
                if videoURl != nil {
                
//                    playerVideo.loadVideoURL(videoURl)
                
                }
            
//                playerVideo.loadVideoURL(videoURl)
            
            }
            
        }catch{
            
            
            print("erorr")
        
        
        }
        
        
    }
    
    
    
    @IBAction func bookButtonWasPressed(_ sender: Any) {
        
        
    }
    
    
   

   
}



