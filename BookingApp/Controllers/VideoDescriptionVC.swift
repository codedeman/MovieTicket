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
    let TAGS = ["Tech", "Design", "Humor", "Travel", "Music", "Writing", "Social Media", "Life", "Education", "Edtech", "Education Reform", "Photography", "Startup", "Poetry", "Women In Tech", "Female Founders", "Business", "Fiction", "Love", "Food", "Sports"]
    
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    
    @IBOutlet weak var nameOfMovieLabel: UILabel!
    
    @IBOutlet weak var nameofDirector: UILabel!
    @IBOutlet weak var descriptionMoive: UILabel?
    @IBOutlet weak var activityData: UIActivityIndicatorView!
    @IBOutlet weak var bookBtn: UIButton?{
        didSet{
        
            self.bookBtn?.layer.cornerRadius = 20
        }
        
    }
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var playerVideo: YouTubePlayerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        activityData.startAnimating()
        
        self.view.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1176470588, blue: 0.1764705882, alpha: 1)
        
//            descriptionMoive = UILabel()
        descriptionMoive?.textColor = .white
        
    
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        view.addSubview(navBar)
        nameOfMovieLabel.textColor = .white
        nameofDirector.textColor = .white
        
        scheduleCollectionView.register(UINib(nibName:
            "ScheduleCell", bundle: nil), forCellWithReuseIdentifier: "ScheduleCell")
        
        let floawLayout = UPCarouselFlowLayout()
                           floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: (scheduleCollectionView?.frame.size.height)!)
                           floawLayout.scrollDirection = .horizontal
                           floawLayout.sideItemScale = 0.8
                           floawLayout.sideItemAlpha = 1.0
                           floawLayout.spacingMode = .fixed(spacing: 5.0)
                           scheduleCollectionView?.collectionViewLayout = floawLayout
        
//                    self.activityData.startAnimating()
                       do{
                           
                           
                           DispatchQueue.global(qos: .background).async {
                           
                               guard let videoURl = try? URL(string: "https://www.youtube.com/watch?v=e82JHkkPw54") else {return}
                               
                               self.activityData.startAnimating()
                               DispatchQueue.main.async {
                        
            
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

extension VideoDescriptionVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == scheduleCollectionView {

            return TAGS.count
        }
        return TAGS.count
//        return TAGS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScheduleCell", for: indexPath) as? ScheduleCell else {return ScheduleCell()}
            let tag = TAGS[indexPath.row]
        
            cell.dateLabel.text = tag
        

            return cell
        

        
        
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
//           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScheduleTimeCell", for: indexPath) as? ScheduleCell else {return ScheduleCell() }
//        guard let tableViewCell = cell as? TableViewCell else { return }

//        guard collectionViewCell = cell as? ScheduleCell else { return ScheduleCell()}
        
//        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        

           
           
       }
    
    
    
    
}


