//
//  Movie.swift
//  BookingApp
//
//  Created by Apple on 11/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class Movie:Codable {
    let id:Int
    let title:String
    let slug:String
    let director:String
    let cast:String
    let description:String
    let image:String
    let trailer:String
    let durationMin:Int
    let premiereAt:String
    let imdbScore:Float

    init(id:Int,title:String,
         slug:String,
         director:String,
         cast:String,
         description:String,
         image:String,
         trailer:String,durationMin:Int,premiereAt:String,imdbScore:Float) {
        
        self.id = id
        self.title = title
        self.slug = slug
        self.director = director
        self.cast = cast
        self.description = description
        self.image = image
        self.trailer = trailer
        self.durationMin = durationMin
        self.premiereAt = premiereAt
        self.imdbScore = imdbScore
        
    }

}

class ListMovie: Codable {
    
    var movies = [Movie]()
    var total: Int = 0

    static func parseData(_ data: Data) -> [Movie] {
         do {
             let  decoder = JSONDecoder()
             let  resultObject = try decoder.decode(ListMovie.self, from: data)
            return resultObject.movies
         } catch {
             print("JSON Error: \(error)")
             return []
         }
     }
}



