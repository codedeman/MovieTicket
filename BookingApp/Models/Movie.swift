//
//  Movie.swift
//  BookingApp
//
//  Created by Apple on 11/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class Movie {
    
    public let name:String
    public let date:String
    public let image:String
    
    init(name:String,date:String,image:String) {
        self.name = name
        self.date = date
        self.image = image
         
    }
}
