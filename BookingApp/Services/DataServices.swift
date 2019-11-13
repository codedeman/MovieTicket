//
//  DataServices.swift
//  BookingApp
//
//  Created by Apple on 11/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class DataServices {
    
    static let instance =  DataServices()
    
    var moviesArray = Array<Movie>()

    let movies = [Movie(name: "Terminator", date: "2019/11/02", image: "https://m.media-amazon.com/images/M/MV5BNzhlYjE5MjMtZDJmYy00MGZmLTgwN2MtZGM0NTk2ZTczNmU5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg"),Movie(name: "Terminator", date: "2019/11/02", image: "https://m.media-amazon.com/images/M/MV5BNzhlYjE5MjMtZDJmYy00MGZmLTgwN2MtZGM0NTk2ZTczNmU5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg"),Movie(name: "Terminator", date: "2019/11/02", image: "https://m.media-amazon.com/images/M/MV5BNzhlYjE5MjMtZDJmYy00MGZmLTgwN2MtZGM0NTk2ZTczNmU5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg"),Movie(name: "Terminator", date: "2019/11/02", image: "https://www.istreamer.com/wp-content/uploads/2019/09/apple-tv-.png")]
//    let movies = Movie(name: "Terminator", date: "02/11/2019", image:"terminator1.jpg")
    
    
    
    
    
    func getMovies() -> [Movie] {

        return movies

    }
    
    
    
}
