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
    
    @IBOutlet weak var orderNumber: UILabel!
    func configureCell(movie:Movie){
        
        loadImage(urlString: movie.image)
        
        if let data = URL(string: movie.image){
            
            
            
//            let placeholder = UIImage(named: "terminator")
            
//            let options:KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.1))]
//                        movieImage?.kf.setImage(with: data,placeholder: placeholder)
//
            

            
        }
        
//        orderNumber.text = movie.date
        

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadImage(urlString:String)  {
        
        
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            
            self.movieImage.image  = cacheImage
        
        }
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url){(data,response,error) in
            let image  = UIImage(data: data!)
            self.imageCache.setObject(image!, forKey: urlString as AnyObject)
            
            DispatchQueue.main.async {
            
                
                self.movieImage.image = image
            }
            
            
        }.resume()
        

        
    }

}
