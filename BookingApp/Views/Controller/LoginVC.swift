//
//  LoginVC.swift
//  BookingApp
//
//  Created by Apple on 11/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    
    let centerView = UIView()
    let usernameLabel:UILabel = {
        
        let username = UILabel()
        username.translatesAutoresizingMaskIntoConstraints = false
        
        username.text = "User name"
        username.tintColor = .white
        return username
        
    }()
    let passwordLabel:UILabel = {
        
        let password = UILabel()
        password.text = "Pass word"
        
        return password
        
        
    }()
    var usernameField:UITextField = {
        
        let usename = UITextField()
        usename.placeholder = "@gmail.com"
        usename.borderStyle = .bezel
        //        usename.background = UIColor.white
        return usename
        
    }()
    let passwordField:UITextField = {
        
        var  pasword = UITextField()
        pasword = customUITextField()
        pasword.placeholder = "123456"
        pasword.borderStyle = .line
        
        //        usename.background = UIColor.white
        return pasword
    }()
    let submitButton = UIButton()
    
    let titleLabel:UILabel = {
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.text = "Login"
        title.tintColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 20)
        return title
    }()
    
    
    let containerView:UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
        
    }()
    
    let imageView:UIImageView = {
        
        
        let imageContent = UIImageView()
        
        imageContent.contentMode = .scaleAspectFit
        imageContent.image = UIImage(named: "popcorn.png")
        
        return imageContent
        
    }()
    
    let loginButton:UIButton = {
        
        let login = UIButton()
        login.layer.cornerRadius = 10
        login.tintColor = .white
        login.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        login.setTitle("Login", for: .normal)
        
        return login
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(containerView)
        containerView.addSubview(usernameField)
        containerView.addSubview(usernameLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(loginButton)
        containerView.addSubview(imageView)
        containerView.addSubview(passwordLabel)
        containerView.addSubview(passwordField)
        setupToHideKeyboardOnTapOnView()
        layoutLoginForm()
        
        
        
        
        
        
        
    }
    
    func layoutLoginForm()  {
        
        
        containerView.snp.makeConstraints { (make) in
            
            make.leading.equalTo(view).offset(0)
            make.trailing.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
            make.top.equalTo(view).offset(0)
        }
        
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(containerView).offset(200)
            make.leading.equalTo(containerView).offset(30)
            make.trailing.equalTo(containerView).offset(-30)
            make.height.equalTo(100)
        }
        
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView).offset(100)
            make.leading.equalTo(containerView).offset(180)
            make.trailing.equalTo(containerView).offset(-150)
            make.height.equalTo(30)
        }
        
        usernameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel).offset(30)
            make.leading.equalTo(containerView).offset(50)
            make.trailing.equalTo(containerView).offset(-50)
            make.height.equalTo(30)
        }
        
        usernameField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameLabel).offset(30)
            make.leading.equalTo(containerView).offset(50)
            make.trailing.equalTo(containerView).offset(-50)
            make.height.equalTo(30)
        }
        
        passwordLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(usernameField).offset(30)
            make.leading.equalTo(usernameField)
            make.trailing.equalTo(containerView).offset(-50)
            make.height.equalTo(30)
            
        }
        
        passwordField.snp.makeConstraints { (make) in
            
            make.top.equalTo(passwordLabel).offset(30)
            make.leading.equalTo(usernameField)
            make.trailing.equalTo(containerView).offset(-50)
            make.height.equalTo(30)
            
        }
        
        
        loginButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(passwordField).offset(50)
            make.leading.equalTo(usernameField)
            make.trailing.equalTo(containerView).offset(-50)
            make.height.equalTo(40)
            
        }
        
    
    }
    
    
    func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    
    
    
}

extension UIView{
    
    func anchor(top:NSLayoutXAxisAnchor,leading:NSLayoutXAxisAnchor,bottom:NSLayoutXAxisAnchor,tralling:NSLayoutXAxisAnchor){
        
        
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
