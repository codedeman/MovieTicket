//
//  MovieViewModel.swift
//  BookingApp
//
//  Created by Apple on 11/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class MovieViewModel {
    

    private var movie:Movie!
    

    public var name:String{
    
        return movie.name
    }
    
    public var image:String{
    
        return movie.image
    }
    
    public var date:String{
    
        return movie.date
        
    }

    public func movieData()->[Movie]{
        
        return DataServices.instance.getMovies()
    }
    
    
}
