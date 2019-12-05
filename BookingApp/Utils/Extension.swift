//
//  Extension.swift
//  BookingApp
//
//  Created by Apple on 11/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

public extension UIImageView {
    
    func cỉcleImage()  {
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    
    
    func loadImageUsingCache(withUrl urlString : String) {
        guard let url = URL(string: urlString) else {return}
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }

        // if not, download image from url
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }

        }).resume()
    }
   
}

extension UIView{

    func cicileView()  {
        
        self.layer.cornerRadius = self.frame.size.width/2

        
        self.clipsToBounds = true
        
        
    }
   
}


//extension UIViewController {
//    func setupSlideMenuItem() {
////        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu")!)
//        self.addRightBarButtonWithImage(UIImage(named: "menu")!)
//        self.slideMenuController()?.removeLeftGestures()
//        self.slideMenuController()?.addLeftGestures()
//    }
//
//    func removeSlideMenuItem(){
//        self.navigationItem.leftBarButtonItem = nil
//        self.slideMenuController()?.removeLeftGestures()
//    }
//}

