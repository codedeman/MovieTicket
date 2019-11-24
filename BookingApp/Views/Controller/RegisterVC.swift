//
//  RegisterVC.swift
//  BookingApp
//
//  Created by Apple on 11/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

import SnapKit

class RegisterVC: UIViewController {

    let titleLabel:UILabel = {
    
        let title = UILabel()
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Sign up to get started"
        title.textColor = .gray
        title.font = .boldSystemFont(ofSize: 28)
        
        
        return title
    
    }()
    
    let avatarImage:UIImageView = {
    
        let avatar = UIImageView()
    
        avatar.image = UIImage(named: "terminator.jpg")
        return avatar
    
        
    }()
    
    let usernameLabel:UILabel = {
        
        let username = UILabel()
        
        username.text = "User name"
        username.tintColor = .gray
        return username
        
    }()
    let passwordLabel:UILabel = {
        
        let password = UILabel()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.tintColor = .gray
        password.text = "Pass word"
        return password
        
        
    }()
    
    let containView:UIView = {
        
        let view = UIView()
        
        view.backgroundColor = .white
        
        return view
    
    }()
    
      var usernameField:UITextField = {
            
            let usename = UITextField()
            usename.placeholder = "@gmail.com"
            usename.borderStyle = .none
        
    
            //        usename.background = UIColor.white
            return usename
            
        }()
        let passwordField:UITextField = {
            
            var  pasword = UITextField()
    //        pasword = customUITextField()
            pasword.placeholder = "123456"
            pasword.borderStyle = .none
            pasword.isSecureTextEntry = true
            
            //        usename.background = UIColor.white
            return pasword
        }()
    
    
    var confirmPassWorld:UITextField = {
    
        
        var  pasword = UITextField()
        pasword.placeholder = "123456"
        pasword.borderStyle = .none
        pasword.isSecureTextEntry = true
        
        return pasword
        
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = .white
        setupRegisterForm()
        avatarImage.cỉcleImage()
        
        usernameField.setup()
        
        
        
//        containView.addSubview(titleLabel)
//        containView.addSubview(avatarImage)

        // Do any additional setup after loading the view.
    }
    
    func setupRegisterForm()  {
        
        self.view.addSubview(containView)
        containView.addSubview(titleLabel)
        containView.addSubview(avatarImage)
        
        containView.addSubview(usernameLabel)
        containView.addSubview(usernameField)
        
        containView.snp.makeConstraints { (make) in
            
            make.top.equalTo(view).inset(0)
            make.leading.equalTo(view).inset(0)
            make.trailing.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(0)
        }
        
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containView).offset(50)
            make.leading.equalTo(containView).offset(50)
            make.trailing.equalTo(containView).offset(-50)
            make.height.equalTo(30)
            
        }
//        
//        
        avatarImage.snp.makeConstraints { (make) in

            make.top.equalTo(titleLabel).offset(100)
            make.centerX.equalTo(containView)

            make.size.equalTo(CGSize(width: 200, height: 200))

        }
        
        
        usernameLabel.snp.makeConstraints { (make) in
            
            
            make.top.equalTo(avatarImage).offset(50)
            make.leading.equalTo(containView).offset(30)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        
        usernameField.snp.makeConstraints { (make) in
                  
                  
                  make.top.equalTo(usernameField).offset(10)
                  make.leading.equalTo(usernameField).offset(30)
                  make.trailing.equalTo(containView).offset(-30)
                  make.height.equalTo(30)
                  
              }
        
        
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
