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
        showtimeButton.backgroundColor = #colorLiteral(red: 0.2, green: 0.1568627451, blue: 0.2431372549, alpha: 1)
        
//        showtimeButton.target(forAction: #selector(timeButton), withSender: nil)
        
    }
    
    @IBAction func showtimeBtnWasPressed(_ sender: Any) {
        
        let storyboard  =  UIStoryboard(name: "Main", bundle: nil)
                      let mainVC = storyboard.instantiateViewController(identifier: "SeatVC") as! SeatVC
        
        
                  
        
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        showtimeButton.target(forAction: #selector(timeButton), withSender: nil)
//
//    }
//    
//    required init?(coder: NSCoder) {
//        self.showtimeButton.target(forAction: #selector(timeButton), withSender: nil)
//    }
//    
//    @objc func timeButton (){
//    
//        print("i'm here")
//    
//    }
    
    func configureCell(schedule:Schedules) {
        
        showtimeButton.setTitle(getDate(dateString: schedule.screeningTime), for: .normal)
        
        
    }
    
    
    func getDate(dateString:String) ->String{
    
               
        let indexStartOfText = dateString.index(dateString.startIndex, offsetBy: 11)
        
        var  substring1 = dateString[indexStartOfText...]  // "Hello>>>"
        let string1 = String(substring1)
        
        let indexEndOfText = string1.index(string1.endIndex, offsetBy: -13)
//
        let substring2 = string1[...indexEndOfText]
        
        
        return String(substring2)
        
    
    }

}
