//
//  TheatersApi.swift
//  BookingApp
//
//  Created by Apple on 12/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TheaterApi{

    static let shared = TheaterApi()
//
    func getTheater(completion:@escaping TheaterReponseCompletion ){
        var arrTheater = [Theaters]()
        print("TOKEN \(BEARER_HEADER)")
        AF.request(URL_THEARTER,method: .get, parameters:nil , encoding: JSONEncoding.default,headers: HTTPHeaders.init(BEARER_HEADER)).responseJSON { (reponse) in
            
            if let error =  reponse.error{
                
                debugPrint("error \(error)")
            }
            guard let data = reponse.data else {return completion(nil)}
            do{
                
                let json = try JSON(data: data).arrayValue
                
                for item in json{
                    
                    let theater =  self.parseJson(json: item)
                    
//                    arrTheater.append(theater)
                    completion(theater)
                }
                
                

                
            }catch{
                debugPrint(error.localizedDescription)
                    completion(nil)
                
            }
//            let jsonDecoder = JSONDecoder()
//
//                do {
//                    let theater = try jsonDecoder.decode(Theaters.self, from: data)
//
//                    completion(theater)
//                } catch {
//                    debugPrint(error.localizedDescription)
//                    completion(nil)
//                }
//
            
        }


    }
    
    func  getAuditoriums()  {
        
        
    }
    
    func parseJson(json:JSON)->Theaters{
        
        let coordinate = json["coordinate"].stringValue
        let id = json["id"].intValue
        let latitude = json["latitude"].floatValue
        let longitude = json["longitude"].floatValue
        let slug = json["slug"].stringValue
        let title = json["title"].stringValue
        let theater = Theaters(coordinate: coordinate, id: id, latitude: latitude, longitude: longitude, slug: slug, title: title)
        
        return theater
        
        
        
    }

}
    

