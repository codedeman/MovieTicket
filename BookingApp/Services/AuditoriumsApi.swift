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
    func getMovies(id:Int,completion: @escaping AuditoriumsreponseComletion){

        AF.request(URL_MOVIE+"\(id)"+URL_AUDITORIUM).responseJSON { (response) in

            if let error = response.error{
            
                debugPrint(error.localizedDescription)
                completion(nil)
                
            }
            guard let data = response.data else {return completion(nil) }
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let auditorium = try jsonDecoder.decode(ResultAuditorium.self, from: data)
                    
                    completion(auditorium.auditoriums)
                } catch {
                    debugPrint(error.localizedDescription)
                    completion(nil)
                }
            
            
        }

    }
    
    
    
    


}
    
