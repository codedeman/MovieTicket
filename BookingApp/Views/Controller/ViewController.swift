//
//  ViewController.swift
//  BookingApp
//
//  Created by Apple on 11/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var timer:Timer!
    let redView:UIView = {
        
       let view = UIView()
        
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    let blueView:UIView = {
        
       let view = UIView()
       view.backgroundColor = .blue
       view.translatesAutoresizingMaskIntoConstraints = false
       
       return view
        
    }()
    
    let greenView:UIView = {
        
       let view = UIView()
       view.backgroundColor = .green
       view.translatesAutoresizingMaskIntoConstraints = false
       
       return view
        
    }()
    
    
    let yellowView:UIView = {
           
          let view = UIView()
          view.backgroundColor = .yellow
          view.translatesAutoresizingMaskIntoConstraints = false
          
          return view
           
       }()
    
    let blackView:UIView = {
        
       let view = UIView()
       view.backgroundColor = .black
       view.translatesAutoresizingMaskIntoConstraints = false
       
       return view
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(redView)
        
        self.view.backgroundColor = .white
//        self.view.addSubview(blueView)
//
//        self.view.addSubview(blackView)
//
//        self.view.addSubview(yellowView)
//        self.view.addSubview(greenView)
        
        redView.snp.makeConstraints { (make) in
            
            make.top.equalTo(view).inset(30)
//            make.leading.equalTo(view).inset(30)
            
            make.centerY.equalTo(view).inset(30)
            
            make.centerX.equalTo(view).offset(30)
            make.height.equalTo(50)
//            make.width.equalTo(50)
        }
//        animateRadius()
        
//        dropView()
        maskGradient()
        
//
//        blueView.snp.makeConstraints { (make) in
////
//            make.top.equalTo(view).inset(30)
//            make.trailing.equalTo(view).inset(50)
//            make.height.equalTo(50)
//            make.width.equalTo(50)
//
////
////
//        }
//
//        blackView.snp.makeConstraints { (make) in
//
//            make.center.equalTo(view)
//            make.size.equalTo(CGSize(width: 50, height: 50))
//        }
//
//        yellowView.snp.makeConstraints { (make) in
//
//            make.bottom.equalTo(view).offset(-30)
//            make.leading.equalTo(view).offset(30)
//            make.height.equalTo(50)
//            make.width.equalTo(50)
//
//
//        }
//
//        greenView.snp.makeConstraints { (make) in
//
//            //                   make.bottom.equalTo(view).offset(-30)
//            //                   make.trailing.equalTo(view).offset(-30)
//            make.height.equalTo(50)
//            //                   make.width.equalTo(50)
//            make.centerY.equalTo(view)
//            make.leading.equalTo(view).offset(30)
//            make.top.equalTo(view).offset(0)
//
//
//        }
        
        

        // Do any additional setup after loading the view.
    }
    
    func animateRadius()  {
        
        
        let newRadious = redView.frame.size.width/2
        UIView.animate(withDuration: 1) {
            
            
            self.redView.layer.cornerRadius = newRadious
            self.redView.center = self.view.center
        }
    }
    
    
    func dropView()  {
        
        redView.frame = CGRect(x: redView.center.x, y: 80, width: 50, height: 50)
        redView.center.x = view.center.x
        redView.layer.cornerRadius = redView.frame.size.width/2
        
            UIView.animate(withDuration: 2) {
                
                self.redView.frame.origin.y = self.view.frame.maxY - self.redView.frame.size.height
                
            }
            
        
    }
    
    func dropByTimer()  {
        
        redView.frame = CGRect(x: redView.center.x, y: 80, width: 50, height: 50)
        redView.center.x = view.center.x
        
        redView.layer.cornerRadius = redView.frame.size.width/2
        
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)


        
        
    }
    
    @objc func runTimer(){
        
        redView.frame.origin.y += 5
        if redView.frame.origin.y >= view.frame.maxY - redView.frame.size.height{
            
            timer.invalidate()
        }
    }
    
    func tranformView()  {
        
        redView.transform  = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        
        
    }
    func maskGradient()  {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.white.cgColor,UIColor.clear.cgColor,UIColor.white.cgColor,UIColor.clear.cgColor,UIColor.white.cgColor]
        
        gradientLayer.locations = [0,0.2,0.4,0.6,0.8,2]
        
        gradientLayer.frame == redView.bounds
        gradientLayer.opacity = 0.5
        
        let angle =  45 * CGFloat.pi/180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0,0,1)
        redView.layer.mask = gradientLayer
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
