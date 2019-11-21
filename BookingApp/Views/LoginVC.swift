//
//  LoginVC.swift
//  BookingApp
//
//  Created by Apple on 11/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    let centerView = UIView()
    let usernameLabel = UILabel()
    let passwordLabel = UILabel()
    let usernameField = UITextField()
    let passwordField = UITextField()
    let submitButton = UIButton()
    
    let containerView:UIView = {
    
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        return view
        
    }()
    
    let blueView:UIView = {
    
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    
    }()
    
    let yellowView:UIView = {
    
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .yellow
            return view
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(containerView)
        containerView.frame = CGRect(x: 30, y: 30, width: 200, height: 200)
        containerView.topAnchor.constraint(equalTo: view.topAnchor,constant: 80).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:  20).isActive = true
        
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20).isActive = true
        
        
        
        
        containerView.addSubview(blueView)
        
        blueView.frame = CGRect(x: 30, y: 30, width: 200, height: 200)
        blueView.topAnchor.constraint(equalTo: containerView.topAnchor,constant:10).isActive = true
        blueView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant:  30).isActive = true
        
        blueView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -30).isActive = true
        blueView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -400).isActive = true
        
        
        containerView.addSubview(yellowView)
        
        
        
        yellowView.heightAnchor.constraint(equalTo: blueView.heightAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true
        yellowView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor).isActive = true
        yellowView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor).isActive = true
        yellowView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -100).isActive = true
        
//        yellowView.frame = CGRect(x: 0, y:0, width: 300, height: 300)
        
        
               
        
        
        
//        usernameLabel.text = "User name:"
//        passwordLabel.text = "Pass word:"
//        
//        usernameField.borderStyle = .roundedRect
//        passwordField.borderStyle = .roundedRect
//        submitButton.setTitle("Login", for: .normal)
//        submitButton.setTitleColor(UIColor.black, for: .normal)
//        submitButton.setTitleColor(UIColor.blue, for: .highlighted)
//        
//        self.centerView.addSubview(usernameField)
//        self.centerView.addSubview(passwordField)
//        self.centerView.addSubview(usernameLabel)
//        self.centerView.addSubview(submitButton)
//        
//        centerView.backgroundColor = .yellow
//        
//        self.view.addSubview(centerView)
//        
//        centerView.translatesAutoresizingMaskIntoConstraints = false
//        
//        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
//        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        centerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        centerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        
//        centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        centerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        
//        passwordLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor)
//        passwordLabel.trailingAnchor.constraint(equalTo: usernameField.trailingAnchor)
//        
    
    
//        centerView.anchor(top: , leading: <#T##NSLayoutXAxisAnchor#>, bottom: <#T##NSLayoutXAxisAnchor#>, tralling: <#T##NSLayoutXAxisAnchor#>)

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

extension UIView{

    func anchor(top:NSLayoutXAxisAnchor,leading:NSLayoutXAxisAnchor,bottom:NSLayoutXAxisAnchor,tralling:NSLayoutXAxisAnchor){
    
        
    
         translatesAutoresizingMaskIntoConstraints = false
        
     }

}
