//
//  ScheduleTimeCell.swift
//  BookingApp
//
//  Created by Apple on 11/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ScheduleTimeCell: UICollectionViewCell {

    @IBOutlet weak var backgroundShowTime: UIView!
    @IBOutlet weak var showTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        showTimeLabel.textColor = .white
        backgroundShowTime.layer.cornerRadius = 10
        showTimeLabel.backgroundColor = .white
        backgroundShowTime.backgroundColor =  .white

        
        
        
        
    }

}
