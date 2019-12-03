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


class VideoDescriptionVC: UIViewController {
    
    
    
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    
    @IBOutlet weak var nameOfMovieLabel: UILabel!
    
    @IBOutlet weak var nameofDirector: UILabel!
    @IBOutlet weak var descriptionMoive: UILabel?
    @IBOutlet weak var activityData: UIActivityIndicatorView!
    @IBOutlet weak var bookBtn: UIButton?
    
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var playerVideo: YouTubePlayerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieApi.shared.getMovies { (user) in
            
            for index in user{
                
                print("best of \(index.name)")
            }
            
        }
//        print("bababa \(ListMovie.)")
        self.activityData.startAnimating()

        loadVideo()
        view.addSubview(calenderView)
        calenderView.topAnchor.constraint(equalTo: descriptionMoive!.topAnchor, constant: 200).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 200).isActive=true
        self.view.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1176470588, blue: 0.1764705882, alpha: 1)
        descriptionMoive?.textColor = .white
    
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        view.addSubview(navBar)
        nameOfMovieLabel.textColor = .white
        nameofDirector.textColor = .white
        
        

    }
    
    func loadVideo()
    {
        do{
            DispatchQueue.global(qos: .background).async {
                guard let videoURl = try? URL(string: "https://www.youtube.com/watch?v=e82JHkkPw54") else {return}
                DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                    self.playerVideo.loadVideoURL(videoURl)
                    self.activityData.stopAnimating()
                }
            }
        }catch{
            
            print("erorr")
            
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

