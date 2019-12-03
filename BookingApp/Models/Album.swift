//
//  MovieTrends.swift
//  BookingApp
//
//  Created by Apple on 11/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class  User: Codable {
    var id: String
    var name: String
    var about: String
    
    init(id: String, name: String, about: String) {
        self.id = id
        self.name = name
        self.about = about
    }
}

class ResultObject: Codable {
    var resultCount: Int = 0
    var results = [User]()
    
    static func parseData(_ data: Data) -> [User] {
        do {
            let  decoder = JSONDecoder()
            let  resultObject = try decoder.decode(ResultObject.self, from: data)
            return resultObject.results
        } catch {
            print("JSON Error: \(error)")
            return []
        }
    }
    
}
