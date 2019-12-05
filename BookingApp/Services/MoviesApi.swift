//
//  MoviesApi.swift
//  BookingApp
//
//  Created by Apple on 12/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftyJSON
import Alamofire

class MovieApi{

    static let shared = MovieApi()
//
    func getMovies(completion:@escaping MovieResponseCompletion){

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
    
//    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {

    func getAllMovies(completion: @escaping(_ user:[User]) ->()){
        var userArr = [User]()
        AF.request(URL2).response { (reponse) in
            
            if let error  = reponse.error{
                
                debugPrint(error.localizedDescription)
                
            }
            guard let data = reponse.data else {return}
            userArr = ResultObject.parseData(data)
            completion(userArr)
            
        }
        
        
        
    }
    

}
