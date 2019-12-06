//
//  TheaterCell.swift
//  BookingApp
//
//  Created by Apple on 12/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TheaterCell: UITableViewCell {

    var arrSchedule = [Schedules]()

    @IBOutlet weak var showtimeCollectionView: UICollectionView!
    @IBOutlet weak var theaterLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        showtimeCollectionView.register(UINib(nibName: "ScheduleTimeCell", bundle: nil), forCellWithReuseIdentifier: "ScheduleTimeCell")

        // Initialization code
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        showtimeCollectionView.delegate = dataSourceDelegate
        showtimeCollectionView.dataSource = dataSourceDelegate
        showtimeCollectionView.tag = row
        showtimeCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension TheaterCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return arrSchedule.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScheduleTimeCell", for: indexPath) as? ScheduleTimeCell else {return ScheduleTimeCell()}
        
        let schedule = arrSchedule[indexPath.row]
        cell.configureCell(schedule: schedule)

        return cell

    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        print("fuck the what \(indexPath.row)")
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScheduleTimeCell", for: indexPath) as? ScheduleTimeCell {
//
//            let storyboard  =  UIStoryboard(name: "Main", bundle: nil)
//                      let mainVC = storyboard.instantiateViewController(identifier: "SeatVC") as! SeatVC
//
//            present(mainVC, animated: true, completion: nil)
//
//
//        }
//
//    }

}
