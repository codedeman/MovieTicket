//
//  AuthService.swift
//  BookingApp
//
//  Created by Apple on 12/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class AuthService{
    
    static let instance = AuthService()

    let defaults = UserDefaults.standard
    
    
    var isLoggedIn : Bool {
           get {
               return defaults.bool(forKey: LOGGED_IN_KEY)
           }
           set {
               defaults.set(newValue, forKey: LOGGED_IN_KEY)
           }
       }
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }

    func loginUser(email:String,password:String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail =  email.lowercased()
        let body:[String:Any] = [
            "email" : lowerCaseEmail,
            "password": password
        ]
        
        
        AF.request(URL_LOGIN,method: .post,parameters: body,encoding: JSONEncoding.default).responseJSON { (repsonse) in
            
            if repsonse.error == nil {
                guard let data =  repsonse.data else {return}
                let json = try! JSON(data: data)
                
                self.authToken = json["token"].stringValue
                self.isLoggedIn =  true
                completion(true)
                
            }else{
                
                completion(false)
                debugPrint("error \(String(describing: repsonse.error))")
            }
            
            
        }
    }
    
    
    
}
