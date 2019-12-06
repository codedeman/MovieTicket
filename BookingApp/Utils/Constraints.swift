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

let URL_MOVIE = URL_BASE+"/api/movies"

let URL_LOGIN = URL_BASE+"/api/auth"

let URL2 = "http://www.json-generator.com/api/json/get/clcVhGGZgy?indent=2"

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let URL_THEARTER = URL_BASE+"/api/theaters"
let URL_AUDITORIUM = "auditoriums"

let URL_SCHEDULE = "/schedules"

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
let BEARER_HEADER = [
    "Authorization":"\(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
typealias MovieResponseCompletion = ([Movie]?) -> Void
typealias TheaterReponseCompletion = (Theaters?)->Void
typealias AuditoriumsreponseComletion = ([Auditorium]?)->Void

typealias ScheduleResponseCompletion = ([Schedules]?)->Void

