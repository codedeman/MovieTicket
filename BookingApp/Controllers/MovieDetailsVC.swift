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
var didTapMovie:((Movie)->Void)?

class MovieDetailsVC: UIViewController {
    var didTapMovie:((Movie)->Void)?

    @IBOutlet weak var nameOfMovieLabel: UILabel!
    @IBOutlet weak var nameofDirector: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var activityData: UIActivityIndicatorView!
    @IBOutlet weak var bookBtn: UIButton?
    @IBOutlet weak var premiereAtLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    var id:Int = 0
    var movieURl = ""
    var descriptionSt = ""
    
    var movieData:Movie!

    
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        
        let vc = HomeVC()
        vc.delegate = self
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var playerVideo: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(movie: movieData)
        
        print("id movie \(movieData.id)")
//        didTapMovie.g
//        let url = movieURl.replacingOccurrences(of: "embed/", with: "watch?v=")
//        nameOfMovieLabel.text = movieData.slug
//        loadVideo(url:url)
        
        self.activityData.startAnimating()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(abc(_:)), name: .movieNotification, object: nil)
        
        
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
    
   

    

    
    
    func updateUI(movie:Movie){
    
        let url = movie.trailer.replacingOccurrences(of: "embed/", with: "watch?v=")
        self.activityData.stopAnimating()
        self.nameOfMovieLabel.text  = movie.title
        self.descriptionLabel?.text = movie.description
        self.nameofDirector.text = movie.director
        self.premiereAtLabel.text = movie.premiereAt
        self.runtimeLabel.text = String(movie.durationMin)
        loadVideo(url:url)

       //
    
    }
    
    
    
    @IBAction func menuButtonWasPressed(_ sender: Any) {
        
        
        self.slideMenuController()?.openRight()
        

    }
    func loadVideo(url:String)
    {
            DispatchQueue.global(qos: .background).async {
                guard let videoURl = URL(string: url) else {return}
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
        scheduleVC.id = movieData.id
        
        present(scheduleVC, animated: true)
        
    }
    
   
}

extension MovieDetailsVC:MovieDelegate{
    func sendData(movie: Movie) {
        
        print(" description: \(movie.description)")
    }
    


}

