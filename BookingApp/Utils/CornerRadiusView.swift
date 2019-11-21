//
//  CornerRadiusView.swift
//  BookingApp
//
//  Created by Apple on 11/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
@IBDesignable
class  CornerRadious: UIView {
    
    @IBInspectable var radius:CGFloat = 0.0
    @IBInspectable var fillColor:UIColor = .cyan
    
    override func draw(_ rect:CGRect){
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        fillColor.setFill()
        path.fill()
    }
}
