//
//  TrendingMoviesCell.swift
//  BookingApp
//
//  Created by Apple on 11/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Kingfisher

class TrendingMoviesCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    var imageCache = NSCache<AnyObject, AnyObject>()

    
    func configureCell(movie:Movie)  {
        
//        let data = URL(string: movie.image)
//         let placeholder = UIImage(named: "terminator")
//
//        let options:KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.1))]
//        imageView?.kf.setImage(with: data,placeholder: placeholder)
        
    }
    
    
    
   
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
