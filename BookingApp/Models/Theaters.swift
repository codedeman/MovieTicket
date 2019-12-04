//
//  Theaters.swift
//  BookingApp
//
//  Created by Apple on 12/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Theaters:Codable{
    
    var coordinate:String
    var id:Int
    var latitude:Float
    var longitude:Float
    var slug:String
    var title:String
    
    
    
//    enum CodingKeys : String, CodingKey {
//        case id
//        case title
//        case slug
//        case longitude
//        case latitude
//        case coordinate
//    }

}


