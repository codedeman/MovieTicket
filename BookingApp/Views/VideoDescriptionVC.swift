//
//  VideoDescriptionVC.swift
//  BookingApp
//
//  Created by Apple on 11/14/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

import WebKit
import AVKit

class VideoDescriptionVC: UIViewController,WKUIDelegate {

    @IBOutlet weak var playerView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.youtube.com/watch?v=oxy8udgWRmo")
             let myRequest = URLRequest(url: myURL!)
             playerView.load(myRequest)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        playerView = WKWebView(frame: .zero, configuration: webConfiguration)
        playerView.uiDelegate = self
        view = playerView
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


