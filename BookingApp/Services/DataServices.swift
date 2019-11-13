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

    let movies = [Movie(name: "Terminator", date: "2019/11/02", image: "https://m.media-amazon.com/images/M/MV5BNzhlYjE5MjMtZDJmYy00MGZmLTgwN2MtZGM0NTk2ZTczNmU5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg"),Movie(name: "Terminator", date: "2019/11/02", image: "https://m.media-amazon.com/images/M/MV5BNzhlYjE5MjMtZDJmYy00MGZmLTgwN2MtZGM0NTk2ZTczNmU5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg"),Movie(name: "Terminator", date: "2019/11/02", image: "https://m.media-amazon.com/images/M/MV5BNzhlYjE5MjMtZDJmYy00MGZmLTgwN2MtZGM0NTk2ZTczNmU5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg"),Movie(name: "Terminator", date: "2019/11/02", image: "https://images-na.ssl-images-amazon.com/images/I/51ni67N3-uL._SY741_.jpg")]
//    let movies = Movie(name: "Terminator", date: "02/11/2019", image:"terminator1.jpg")
    
    
    
    
    
    func getMovies() -> [Movie] {

        return movies

    }
    
    
    
}
