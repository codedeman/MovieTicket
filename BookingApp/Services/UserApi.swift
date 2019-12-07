//
//  UserApi.swift
//  BookingApp
//
//  Created by Apple on 12/7/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class UserApi{
    
    static let instance = UserApi()
    
        func getProfile(completion: @escaping UserResponseCompletion){
        
        
        AF.request(URL_PROFILE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HTTPHeaders.init(BEARER_HEADER)).responseJSON { (response) in
            
            print("head \(BEARER_HEADER)")
            print("url \(URL_PROFILE)")
        
            if response.error == nil{
                
                guard let data = response.data else {return}
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let profile = try jsonDecoder.decode(User.self, from: data)
                    
                    completion(profile)
                } catch {
                    debugPrint(error.localizedDescription)
                    completion(nil)
                }
                
                
                
            }
            
            
        }
        
        
        
    }
     
    
}
