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
    func getMovies(completion:@escaping (_ list:[Movie])->()){

//        let movie
        guard let url = URL(string: LIST_URL) else {return}
        AF.request(url).responseJSON { (response) in

            if let error = response.error{
            
                debugPrint("error \(error)")
            }
            guard let data = response.data else {return}
            let json = try? JSON(data: data).object
            
            guard let jsonItems = json as? [String:Any] else {return}
            
            if let item = Mapp
            
            
            



        }


    }
    
//    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {

    func getMovies(completion: @escaping(_ user:[User]) ->()){
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
