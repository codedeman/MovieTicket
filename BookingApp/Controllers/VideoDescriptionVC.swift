//
//  VideoDescriptionVC.swift
//  BookingApp
//
//  Created by Apple on 11/14/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import YouTubePlayer

enum MyTheme {
    case light
    case dark
}


class VideoDescriptionVC: UIViewController{
    
  
    @IBOutlet weak var nameOfMovieLabel: UILabel!
    
    @IBOutlet weak var nameofDirector: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var activityData: UIActivityIndicatorView!
    @IBOutlet weak var bookBtn: UIButton?
    
    
    @IBOutlet weak var premiereAtLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBOutlet weak var playerVideo: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = VideoDescriptionVC()
        //            let slideVC =
        let sliceVC = ProfileVC()
        let slideMenuController = SlideMenuController(mainViewController: mainVC, rightMenuViewController: sliceVC)
       
        
        
//        menuButtonWasPressed.ad
//        menuButtonWasPressed.target = self.revealViewController()
////        menuButtonWasPressed.action = Selector(("revealToggle:"))
//        menuButtonWasPressed.action = "revealToggle:"
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        self.activityData.startAnimating()

        TheaterApi.shared.getTheater { (theater) in
            
            print("theater  \(String(describing: theater?.coordinate))")
        }
        MovieApi.shared.getMovies { (movie) in
            
            for index in movie!{
                self.setupView(movie: index)
            
            }
        }
        
        view.addSubview(calenderView)
        calenderView.topAnchor.constraint(equalTo: premiereAtLabel!.topAnchor, constant: 100).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 200).isActive=true
        self.view.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1176470588, blue: 0.1764705882, alpha: 1)
        descriptionLabel?.textColor = .white
    
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
//        navBar.tintColor = #colorLiteral(red: 0.2470588235, green: 0.2078431373, blue: 0.2784313725, alpha: 1)
//        navBar.backgroundColor  = #colorLiteral(red: 0.2470588235, green: 0.2078431373, blue: 0.2784313725, alpha: 1)
//
//        view.addSubview(navBar)
        nameOfMovieLabel.textColor = .white
        nameofDirector.textColor = .white
        

    }
    
    func setupView(movie:Movie)  {
        nameOfMovieLabel.text  = movie.title
        nameofDirector.text = movie.director
        descriptionLabel?.text = movie.description
        premiereAtLabel.text = movie.premiereAt
        runtimeLabel.text = String(movie.durationMin)
        loadVideo()
        
    }
    
    @IBAction func menuButtonWasPressed(_ sender: Any) {
        
        
//        let profile = ProfileVC()
//        profile.modalPresentationStyle = .overCurrentContext
//        present(profile, animated: true, completion: nil)
        
//        present(slideMenuController, animated: true, completion: nil)

        

//        if self.slideMenuController() != nil {
//
//            print("what the fuck")
//        }
//        self.slideMenuController()?.openRight()
//        SlideMenuOptions.contentViewScale = 0.50
////
////        let mainVC = VideoDescriptionVC()
////         //            let slideVC =
////         let sliceVC = ProfileVC()
//         let slideMenuController = SlideMenuController(mainViewController: VideoDescriptionVC(), rightMenuViewController: ProfileVC())
        

    }
    func loadVideo()
    {
            DispatchQueue.global(qos: .background).async {
                guard let videoURl = URL(string: "https://www.youtube.com/watch?v=e82JHkkPw54") else {return}
                DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                    self.playerVideo.loadVideoURL(videoURl)
                    self.activityData.stopAnimating()
                }
            }
        
                              
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
               
        
    }
    
    
    
    @IBAction func bookButtonWasPressed(_ sender: Any) {
        
        
        let seatVC = SeatVC()
        present(seatVC, animated: true) {
            
        }
        
    }
    
    
   

   
}

