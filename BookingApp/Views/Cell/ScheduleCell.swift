//
//  ScheduleCell.swift
//  BookingApp
//
//  Created by Apple on 11/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ScheduleCell: UICollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var mothLabel: UILabel!
    
    @IBOutlet weak var timeCollection: UICollectionView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        timeCollection.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.2078431373, blue: 0.2784313725, alpha: 1)
    
       
        
    }
    
    

}

