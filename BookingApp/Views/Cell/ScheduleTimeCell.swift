//
//  ScheduleTimeCell.swift
//  BookingApp
//
//  Created by Apple on 11/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ScheduleTimeCell: UICollectionViewCell {

    @IBOutlet weak var showtimeButton:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        showtimeButton.layer.cornerRadius = 5
//        showtimeButton.layer.borderColor = UIColor.white as? CGColor
//        showtimeButton.layer.borderWidth = 2
        
        
//        showTimeLabel.textColor = .white
//        backgroundShowTime.layer.cornerRadius = 10
//        showTimeLabel.backgroundColor = .white
//        backgroundShowTime.backgroundColor =  .white

        
        
        
        
    }

}
