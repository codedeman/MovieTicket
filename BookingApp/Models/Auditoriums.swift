//
//  Auditoriums.swift
//  BookingApp
//
//  Created by Apple on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
struct Auditorium:Codable{
    
    let id:Int
    let title:String
    
}

class ResultAuditorium: Codable {
    
    let total:Int
    let auditoriums:[Auditorium]
    
}

class Schedules:Codable {
    let auditoriumId:Int
    let screeningTime:String
    
    init(auditoriumId:Int,screeningTime:String) {
        
        self.auditoriumId = auditoriumId
        self.screeningTime = screeningTime
    }
}
