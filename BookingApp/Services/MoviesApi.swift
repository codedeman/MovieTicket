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

        AF.request(URL_MOVIE).responseJSON { (response) in

            if let error = response.error{
            
                debugPrint(error.localizedDescription)
                completion(nil)
                
            }
            guard let data = response.data else {return completion(nil) }
            
                
                let movie = ListMovie.parseData(data)
                completion(movie)

        }


    }
    

    
    func getSchedule(id:Int,completion:@escaping ScheduleResponseCompletion){
        
        AF.request(URL_MOVIE+"/\(id)"+URL_SCHEDULE,method: .get,encoding: JSONEncoding.default).responseJSON { (response) in
            var arrSchedule = [Schedules]()
            let url = URL_MOVIE+"/\(id)"+URL_SCHEDULE
            print("url:\(url)")
            if let error = response.error{
                
                debugPrint("Error \(error)")
                completion(nil)
            }
            guard let data = response.data else {return}
                
            let json = try! JSON(data: data).arrayValue
                for item in json{
                    let schedule =  self.parseSchedule(json: item)
                    arrSchedule.append(schedule)
                    completion(arrSchedule)
                    
                }
            
        }
        
        
    }
    
    
    func parseSchedule(json:JSON)->Schedules{
        let auditoriumId = json["auditoriumId"].intValue
        let screeningTime = json["screeningTime"].stringValue
        let schedule = Schedules(auditoriumId: auditoriumId, screeningTime: screeningTime)
        
        return schedule
    }
    

}
