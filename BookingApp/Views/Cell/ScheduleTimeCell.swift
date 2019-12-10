//
//  ScheduleTimeCell.swift
//  BookingApp
//
//  Created by Apple on 11/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol ScheduleCellDelegate {
    
    func didTapShowTime(time:Schedules)
}
class ScheduleTimeCell: UICollectionViewCell {

    @IBOutlet weak var showtimeButton:UIButton!
    var timeCellDelegate:ScheduleCellDelegate?
    var schedule:Schedules?
    override func awakeFromNib() {
        super.awakeFromNib()
        showtimeButton.layer.cornerRadius = 5
        showtimeButton.backgroundColor = #colorLiteral(red: 0.2, green: 0.1568627451, blue: 0.2431372549, alpha: 1)
        
    }
    
    @IBAction func showtimeBtnWasPressed(_ sender: Any) {
        
       guard let unwrappedSchedule = schedule  else { return }
        timeCellDelegate?.didTapShowTime(time: unwrappedSchedule)
    }
    

    
    func configureCell(schedule:Schedules) {
        
        showtimeButton.setTitle(getDate(dateString: schedule.screeningTime), for: .normal)
        
        
    }
    
    
    func getDate(dateString:String) ->String{
    
               
        let indexStartOfText = dateString.index(dateString.startIndex, offsetBy: 11)
        let  substring1 = dateString[indexStartOfText...]
        let string1 = String(substring1)
        
        let indexEndOfText = string1.index(string1.endIndex, offsetBy: -13)
        let substring2 = string1[...indexEndOfText]
        
        
        return String(substring2)
        
    
    }

}
