//
//  Constraints.swift
//  BookingApp
//
//  Created by Apple on 11/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

import UIKit
typealias CompletionHandler = (_ Success: Bool) -> ()

let URL_BASE = "https://movie-tickets-vinid.herokuapp.com"

let LIST_URL = URL_BASE+"/api/movies"

let URL_LOGIN = URL_BASE+"/api/auth"

let URL2 = "http://www.json-generator.com/api/json/get/clcVhGGZgy?indent=2"

typealias MovieResponseCompletion = ([Movie]?) -> Void


let TOKEN_KEY = "token"

let LOGGED_IN_KEY = "loggedIn"



let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
    
]
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
