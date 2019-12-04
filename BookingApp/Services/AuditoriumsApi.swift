//
//  AuditoriumsApi.swift
//  BookingApp
//
//  Created by Apple on 12/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class AuditoriumApi{

    static let shared = AuditoriumApi()
//
    func getMovies(completion:@escaping MovieResponseCompletion){

//        let movie
//        guard let url = URL(string: LIST_URL) else {return}
        AF.request(LIST_URL).responseJSON { (response) in

            if let error = response.error{
            
                debugPrint(error.localizedDescription)
                completion(nil)
                
            }
            guard let data = response.data else {return completion(nil) }
            
                
                let movie = ListMovie.parseData(data)
                completion(movie)
           

        }


    }

}
    
