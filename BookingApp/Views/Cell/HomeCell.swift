//
//  HomeCell.swift
//  BookingApp
//
//  Created by Apple on 11/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Kingfisher

class HomeCell: UICollectionViewCell {
    
    var imageCache = NSCache<AnyObject, AnyObject>()


    @IBOutlet weak var movieImage: UIImageView!{
        didSet{
            self.movieImage.layer.cornerRadius = 10
        
        }
    
    }
    
    func configureCell(movie:Movie){
        
        movieImage.loadImageUsingCache(withUrl: movie.image)
        
            

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
