//
//  MovieTrends.swift
//  BookingApp
//
//  Created by Apple on 11/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class Album {
    public var name:String = ""
    public var date:String = ""
    public var image:String = ""
    
    
    init(object:Any) {
        if let dic:Dictionary<String,Any> = object as? Dictionary<String,Any>{

            guard let name = dic["login"] as? String else {return}
            self.name = name
            
            if let image = dic["avatar_url"] as? String  {
                self.image = image
            }else{
                
                self.image = "jocker-1.jpg"

            }
        }
        
    }
    
    
}
