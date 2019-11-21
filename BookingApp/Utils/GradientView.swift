//
//  GradientView.swift
//  BookingApp
//
//  Created by Apple on 11/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor:UIColor = .red
    @IBInspectable var endColor:UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    override class var layerClass: AnyClass{
        return CAGradientLayer.self
    }
    override func layoutSubviews() {
        
        (layer as! CAGradientLayer).colors = [startColor.cgColor,endColor.cgColor]
    }
    
}
