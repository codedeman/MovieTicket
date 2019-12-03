//
//  customUITextField.swift
//  BookingApp
//
//  Created by Apple on 11/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
//@IBDesignable
//open class customUITextField:UITextField{
//    
//   
//    
//    override init(frame: CGRect) {
//          super.init(frame: frame)
//          setup()
//      }
//      required public init?(coder aDecoder: NSCoder) {
//          super.init(coder: aDecoder)
//          setup()
//      }
//    
//}

extension UITextField{
    
       func setup()  {
           
           let border = CALayer()
           let width = CGFloat(2.0)
           border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: 1.0)
           border.borderWidth = width
           self.layer.addSublayer(border)
           self.layer.masksToBounds = true
           
       }
    
    
}
