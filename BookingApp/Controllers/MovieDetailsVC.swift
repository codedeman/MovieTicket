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

class MovieDetailsVC: UIViewController,SendDetail {
    func sendData(id: Int, title: String, slug: String, director: String, cast: String, description: String, image: String, trailer: String, durationMin: Int, premiereAt: String, imdbScore: Float) {
        print("bababa \(id)")
    }
    
    
    @IBOutlet weak var nameOfMovieLabel: UILabel!
    @IBOutlet weak var nameofDirector: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var activityData: UIActivityIndicatorView!
    @IBOutlet weak var bookBtn: UIButton?
    @IBOutlet weak var premiereAtLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    var id:Int = 0
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        
        let home = HomeVC()
        home.delegate = self
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var playerVideo: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.setupSlideMenuItem()
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(openMenu))

      
        self.activityData.startAnimating()
        TheaterApi.shared.getTheater { (theater) in
            
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

        nameOfMovieLabel.textColor = .white
        nameofDirector.textColor = .white
        

    }
    
    @objc func openMenu(){
        self.slideMenuController()?.openRight()
    }
    
    func setupView(movie:Movie)  {
        nameOfMovieLabel.text  = movie.title
//        nameofDirector.text = movie.director
        descriptionLabel?.text = movie.description
        premiereAtLabel.text = movie.premiereAt
        runtimeLabel.text = String(movie.durationMin)
        
        let originurl = "https://www.youtube.com/watch?v"
        
        loadVideo()
        
    }
    
    @IBAction func menuButtonWasPressed(_ sender: Any) {
        
        
        self.slideMenuController()?.openRight()
        

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
        
        let scheduleVC = ScheduleVC()
            scheduleVC.id = id
        
        present(scheduleVC, animated: true)
        
    }
    
   
}

