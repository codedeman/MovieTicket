//
//  Movie.swift
//  BookingApp
//
//  Created by Apple on 11/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
//import ObjectMapper
//
//class ListMovie:Mappable{
//
//    var movie:[Movie]?
//
//    required init?(map: Map) {
//
//    }
//    func mapping(map: Map) {
//
//        movie <- map["movies"]
//    }
//
//
//}
//
//class Movie: Mappable {
//    required init?(map: Map) {
//
//    }
//
//    var title:String = ""
//    var slug:String = ""
//    var director:String = ""
//    var cast:String = ""
//    var description:String = ""
//    var image:String = ""
//    var trailer:String = ""
//    var durationMin:String = ""
//    var premiereAt:String = ""
//
//
//    func mapping(map: Map) {
//
//        title <- map["title"]
//        slug <- map["slug"]
//        director <- map["director"]
//        cast <- map["cast"]
//        description <- map["description"]
//        image <- map["image"]
//        trailer <- map["trailer"]
//        durationMin <- map["durationMin"]
//
//
//    }
//
//
//}

class Movie:Codable {

    let title:String
    let slug:String
    let director:String
    let cast:String
    let description:String
    let image:String
    let trailer:String

    let durationMin:String
    let premiereAt:String

}


