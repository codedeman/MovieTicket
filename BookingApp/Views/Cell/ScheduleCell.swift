//
//  ScheduleCell.swift
//  BookingApp
//
//  Created by Apple on 11/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ScheduleCell: UICollectionViewCell {
    let TAGS = ["Tech", "Design", "Humor", "Travel", "Music", "Writing", "Social Media", "Life", "Education", "Edtech", "Education Reform", "Photography", "Startup", "Poetry", "Women In Tech", "Female Founders", "Business", "Fiction", "Love", "Food", "Sports"]

    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var mothLabel: UILabel!
    
    @IBOutlet weak var timeCollection: UICollectionView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        timeCollection.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.2078431373, blue: 0.2784313725, alpha: 1)
    
        timeCollection.delegate = self
        timeCollection.dataSource = self
        timeCollection.register(UINib(nibName: "ScheduleTimeCell", bundle: nil), forCellWithReuseIdentifier: "ScheduleTimeCell")
        
        mothLabel.textColor = .white
        dateLabel.textColor = .white
        
    }
    
    func setupViews()  {
        
        timeCollection.register(UINib(nibName: "ScheduleTimeCell", bundle: nil), forCellWithReuseIdentifier: "ScheduleTimeCell")
    }

}

extension ScheduleCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScheduleTimeCell", for: indexPath) as? ScheduleTimeCell else {return ScheduleTimeCell() }

        let tag = TAGS[indexPath.row]

        
        cell.showTimeLabel.text =  "10"
        return cell
    }

    
   


}
