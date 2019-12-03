//
//  Constraints.swift
//  BookingApp
//
//  Created by Apple on 11/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

import UIKit

let URL_BASE = "https://movie-tickets-vinid.herokuapp.com"

let LIST_URL = URL_BASE+"/api/movies"
let URL2 = "http://www.json-generator.com/api/json/get/clcVhGGZgy?indent=2"

typealias MovieResponseCompletion = ([ListMovie]?) -> Void


//let BEARER_HEADER = [
//    "Authorization":"Bearer \(AuthService.instance.authToken)",
//    "Content-Type": "application/json; charset=utf-8"
//]


//struct Storyboard {
//
//
//}
//
//struct Identifiers {
//
//    static let HomeCell = "HomeCell"
//    static let TrendingMoviesCell = "TrendingMoviesCell"
//}
//
//struct Segues {
//
//    static let toMovieDescription = "toMovieDescription"
//
//
//}
