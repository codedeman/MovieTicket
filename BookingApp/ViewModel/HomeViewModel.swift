//
//  AbumMovieViewModel.swift
//  BookingApp
//
//  Created by Apple on 11/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

import Alamofire
import SwiftyJSON

class HomeViewModel:NSObject {
    

    private let disposable = DisposeBag()
    
    public let albums : BehaviorRelay<[Album]> = BehaviorRelay(value: [])
        
    public func requestData(){
        var abumArray:Array<Album> = []
        AF.request(URL_BASE).responseJSON { (response) in
            guard let data =  response.data else {return}
            
            if let json = try? JSON(data: data).dictionary{
                
                guard let item = json["items"] else {return}
                
                for index in item{
                    
                    let object =  Album(object: json)
                    abumArray.append(object)

                }
                
                self.albums.accept(abumArray)
                
//
                
            }
            
            
            
        }
        
        
        
        
        
        
        
    }

    
}
