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
    var id:Int!

    @IBOutlet weak var showtimeCollectionView: UICollectionView!
    @IBOutlet weak var theaterLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        showtimeCollectionView.delegate = self
        showtimeCollectionView.dataSource = self
        showtimeCollectionView.register(UINib(nibName: "ScheduleTimeCell", bundle: nil), forCellWithReuseIdentifier: "ScheduleTimeCell")
        
       
    }
    
    func configureCell(auditorium:Auditorium,id:Int)  {
    
        self.theaterLabel.text = auditorium.title
        
        MovieApi.shared.getSchedule(id: id) { (schedule) in
            
            self.arrSchedule = schedule!
            self.showtimeCollectionView.reloadData()
            
            for items in schedule!{
                
                print("id schedule \(items.auditoriumId)")
            
            }
                   
        }
            
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        showtimeCollectionView.delegate = dataSourceDelegate
        showtimeCollectionView.dataSource = dataSourceDelegate
        showtimeCollectionView.tag = row
        showtimeCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

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
        
        
        
    }
    


}
