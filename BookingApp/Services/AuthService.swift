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
    
//    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {

    
    func registerUser(email:String,firstName:String,lastname:String,password:String,completion: @escaping CompletionHandler){
        
        
        let body = ["email":email,
                    "firstName":firstName,
                    "lastName":lastname,
                    "password":password
        
                ]
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let error = response.error{
                debugPrint("error:\(error)")
                completion(false)
            }
            guard let data = response.data else {return}
            
            let json =  try! JSON(data: data)
            
            completion(true)
            
        }
    
    }
    
    func getProfile(completion: @escaping UserResponseCompletion){
        
        
        AF.request(URL_PROFILE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HTTPHeaders.init(BEARER_HEADER)).responseJSON { (response) in
            
            if response.error == nil{
                guard let data = response.data else {return}
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let user = try jsonDecoder.decode(User.self, from: data)
                    completion(user)
                } catch {
                    debugPrint(error.localizedDescription)
                    completion(nil)
                }
                
            
            }
        }
    
    
    
    }
    
    
//    "email": "kevinpham@gmail.com",
//    "firstName": "Kevin",
//    "lastName": "Pham",
//    "password": "1234"
    
    
}
