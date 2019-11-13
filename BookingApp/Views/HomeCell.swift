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
    
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var orderNumber: UILabel!
    func configureCell(movie:Movie){
        
        if let data = URL(string: movie.image){
            
            let placeholder = UIImage(named: "terminator")
            
            let options:KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.1))]
                        movieImage?.kf.setImage(with: data,placeholder: placeholder)

            
        }
        
        orderNumber.text = movie.date
        

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
