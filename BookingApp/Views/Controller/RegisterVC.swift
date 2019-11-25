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
//        usename.backgroundColor = .
    
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
    
    
    var confirmLabel:UILabel = {
    
        
        let confirm = UILabel()
        confirm.translatesAutoresizingMaskIntoConstraints = false
        confirm.tintColor = .gray
        confirm.text = "Confirm passworld"
        return confirm
        
    }()
    
    var confirmField:UITextField = {
        
        
        var  confirm = UITextField()
        //        pasword = customUITextField()
        confirm.placeholder = "123456"
//        confirm.borderStyle = .roundedRect
        confirm.isSecureTextEntry = true
        
        //        usename.background = UIColor.white
        return confirm
        
    }()
    
//    let al
    
    
    let registerButton:UIButton = {
        
       
        
        let register = UIButton()
        register.backgroundColor = #colorLiteral(red: 0.8039215686, green: 0.2274509804, blue: 0.231372549, alpha: 1)
        register.tintColor = .white
        register.layer.cornerRadius = 10
        register.setTitle("Register", for: .normal)
        return register
        
    }()
    
    let acountButton:UIButton = {
    
    
        let acount = UIButton()
        
        acount.setTitle("Sign in", for: .normal)
//        acount.tintColor = .black
        acount.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
        return acount
    }()
    
    let acountLabel:UILabel = {
    
    
        let acount = UILabel()
        acount.textColor = .gray
        acount.text = "Alredy have an acount?"
        return acount
    
    }()
    
    let orangeView:UIView = {
    
    
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.662745098, blue: 0.4823529412, alpha: 1)
        
//        view.cicileView()
        
        view.frame.size = CGSize(width: 20, height: 100)
        
        
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = .white
        setupRegisterForm()
//        avatarImage.cỉcleImage()
        
        usernameField.setup()
        
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderColor = UIColor.black.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        avatarImage.clipsToBounds = true
        
        
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
//        containView.addSubview(titleLabel)
//        containView.addSubview(avatarImage)

        // Do any additional setup after loading the view.
    }
    @objc func register(){
        
        
        
    }
    
    func setupRegisterForm()  {
        
        self.view.addSubview(containView)
        containView.addSubview(titleLabel)
        containView.addSubview(avatarImage)
        
        containView.addSubview(usernameLabel)
        containView.addSubview(usernameField)
        containView.addSubview(passwordLabel)
        containView.addSubview(passwordField)
        containView.addSubview(confirmLabel)
        containView.addSubview(confirmField)
        containView.addSubview(registerButton)
        
        containView.addSubview(acountLabel)
        containView.addSubview(acountButton)
//        containView.addSubview(orangeView)
//        orangeView.cicileView()
//        
//        orangeView.snp.makeConstraints { (make) in
//            
//            make.top.equalTo(containView).offset(50)
//            make.leading.equalTo(containView).offset(0)
//            make.trailing.equalTo(containView).offset(-200)
//            make.height.equalTo(100)
//        }
        
        containView.snp.makeConstraints { (make) in
            
            make.top.equalTo(view).inset(0)
            make.leading.equalTo(view).inset(0)
            make.trailing.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(0)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containView).offset(100)
            make.leading.equalTo(containView).offset(50)
            make.trailing.equalTo(containView).offset(-50)
            make.height.equalTo(30)
            
        }
//        
//        
        avatarImage.snp.makeConstraints { (make) in

            make.top.equalTo(titleLabel).offset(100)
            make.centerX.equalTo(containView)

            make.size.equalTo(CGSize(width: 100, height: 100))

        }
        
        
        usernameLabel.snp.makeConstraints { (make) in
            
            
            make.bottom.equalTo(avatarImage).offset(30)
            make.leading.equalTo(containView).offset(30)
            make.trailing.equalTo(containView).offset(-30)
//            make.height.equalTo(30)
            
            
        }
        
        usernameField.snp.makeConstraints { (make) in
                  
                  
                  make.top.equalTo(usernameLabel).offset(50)
                  make.leading.equalTo(usernameLabel).offset(0)
                  make.trailing.equalTo(containView).offset(-30)
                  make.height.equalTo(30)
                  
        }
        
        
        passwordLabel.snp.makeConstraints { (make) in
            
            
            make.top.equalTo(usernameField).offset(30)
            make.leading.equalTo(containView).offset(30)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        
        passwordField.snp.makeConstraints { (make) in
            
            make.top.equalTo(passwordLabel).offset(30)
            make.leading.equalTo(passwordLabel).offset(0)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        
        
        confirmLabel.snp.makeConstraints { (make) in
            
            
            make.top.equalTo(passwordField).offset(30)
            make.leading.equalTo(passwordField).offset(0)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        
        confirmField.snp.makeConstraints { (make) in
            
            
            make.top.equalTo(confirmLabel).offset(30)
            make.leading.equalTo(confirmLabel).offset(0)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        
        registerButton.snp.makeConstraints { (make) in
            
            make.top.equalTo(confirmField).offset(50)
            make.leading.equalTo(containView).offset(30)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(50)
            
        }
        
        acountLabel.snp.makeConstraints { (make) in
            
            
            make.top.equalTo(registerButton).offset(50)
            make.leading.equalTo(containView).offset(80)
//            make.trailing.equalTo(containView).offset(-0)
            make.height.equalTo(50)
            
            
            
        }
        acountButton.snp.makeConstraints { (make) in
            make.top.equalTo(registerButton).offset(50)
            make.leading.equalTo(registerButton).offset(230)
            make.height.equalTo(50)


            
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
