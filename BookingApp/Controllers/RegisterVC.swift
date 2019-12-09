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

//    let titleLabel:UILabel = {
//        let title = UILabel()
//        title.translatesAutoresizingMaskIntoConstraints = false
//        title.text = "Sign up to get started"
//        title.textColor = .gray
//        title.font = .boldSystemFont(ofSize: 28)
//        return title
//
//    }()
    
    let avatarImage:UIImageView = {
        
        let avatar = UIImageView()
        
        avatar.image = UIImage(named: "terminator.jpg")
        
        avatar.frame.size = CGSize(width: 100, height: 100)
        return avatar
        
        
    }()
    
    let emailLabel:UILabel = {
        
        let username = UILabel()
        
        username.text = "Email"
        username.textColor = .gray
        return username
        
    }()
    
    let firstNameLabel:UILabel = {
        let username = UILabel()
        username.text = "First Name"
        username.textColor = .gray
        return username
        
    }()
    
    let containView:UIView = {
        
        let view = UIView()
        
        view.backgroundColor = .white
        
        return view
        
    }()
    
    let emailTxt:UITextField = {
        
        let usename = UITextField()
        usename.placeholder = "@gmail.com"
        usename.borderStyle = .none
        
        return usename
        
    }()
    
    
    let fullnameTxt:UITextField = {
        
        let usename = UITextField()
        usename.placeholder = "@gmail.com"
        usename.borderStyle = .none
        
        return usename
        
    }()
    
    let firstNameTxt:UITextField = {
        var  firstname = UITextField()
        firstname.placeholder = "Kevin"
        firstname.borderStyle = .none
        return firstname
    }()
    
    
    var lastNameLabel:UILabel = {
        let confirm = UILabel()
        confirm.translatesAutoresizingMaskIntoConstraints = false
        confirm.textColor = .gray
        confirm.text = "Last name"
        return confirm
        
    }()
    
    var lastNameTxt:UITextField = {
        
        var  confirm = UITextField()
        confirm.placeholder = "Pham"
        return confirm
        
    }()
    
    var fullNameLabel:UILabel = {
        let confirm = UILabel()
        confirm.translatesAutoresizingMaskIntoConstraints = false
        confirm.textColor = .gray
        confirm.text = "Full name"
        return confirm
        
    }()
    
    var fullNameTxt:UITextField = {
        
        var  confirm = UITextField()
        confirm.placeholder = "Kevin Pham"
        return confirm
        
    }()
    
    
    var passwordLabel:UILabel = {
        let confirm = UILabel()
        confirm.translatesAutoresizingMaskIntoConstraints = false
        confirm.textColor = .gray
        confirm.text = "password"
        return confirm
        
    }()
    
    var passwordTxt:UITextField = {
        
        var  confirm = UITextField()
        confirm.placeholder = "*****"
        confirm.isSecureTextEntry = true
        return confirm
        
    }()
    
    
    
    let registerButton:UIButton = {
        let register = UIButton()
        register.backgroundColor = #colorLiteral(red: 0.8039215686, green: 0.2274509804, blue: 0.231372549, alpha: 1)
        register.setTitleColor(.white, for: .normal)
//        register.se
        register.layer.cornerRadius = 10
        register.setTitle("Register", for: .highlighted)
        return register
        
    }()
    
    let acountButton:UIButton = {
    
        let acount = UIButton()
        acount.setTitle("Sign in", for: .normal)
        acount.setTitleColor(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1), for: .highlighted)
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
        view.frame.size = CGSize(width: 350, height: 350)
        return view
        
    }()
    
    let pinkView:UIView = {
    
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.3607843137, blue: 0.5176470588, alpha: 1)
        view.frame.size = CGSize(width: 400, height: 400)
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupToHideKeyboardOnTapOnView()
        registerButton.addTarget(self, action: #selector(registerBtnWasPressed), for: .allTouchEvents)
        acountButton.addTarget(self, action: #selector(signInBtnWasPressed), for: .allTouchEvents)
        setupRegisterForm()
        emailTxt.setup()
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderColor = UIColor.black.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        avatarImage.clipsToBounds = true
        registerButton.addTarget(self, action: #selector(registerBtnWasPressed), for: .touchUpInside)

    }
    @objc func signInBtnWasPressed(){
        
        
        dismiss(animated: true, completion: nil)
    
    }
    @objc func registerBtnWasPressed(){
        
        guard let email = emailTxt.text , emailTxt.text != "" else { return }

        guard let firstname = firstNameTxt.text , emailTxt.text != "" else { return }

        guard let lastname = lastNameTxt.text , emailTxt.text != "" else { return }

        guard let password = passwordTxt.text , emailTxt.text != "" else { return }

        AuthService.instance.registerUser(email: email, firstName: firstname, lastname: lastname, password: password) { (sucess) in
            
            if sucess{
                self.dismiss(animated: true, completion: nil)
                
            }
            
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
    
    func setupRegisterForm()  {
        
        self.view.addSubview(containView)
        containView.addSubview(avatarImage)
        containView.addSubview(emailLabel)
        containView.addSubview(emailTxt)
        containView.addSubview(passwordLabel)
        containView.addSubview(firstNameTxt)
        containView.addSubview(lastNameLabel)
        containView.addSubview(lastNameTxt)
        containView.addSubview(fullNameLabel)
        containView.addSubview(fullNameTxt)
        containView.addSubview(passwordLabel)
        containView.addSubview(passwordTxt)
        containView.addSubview(registerButton)
        containView.addSubview(acountLabel)
        containView.addSubview(acountButton)
//        containView.addSubview(orangeView)
//        containView.addSubview(pinkView)
//
        containView.addSubview(firstNameLabel)
        containView.addSubview(lastNameLabel)
        orangeView.cicileView()
        pinkView.cicileView()
        
        
        
//        orangeView.snp.makeConstraints { (make) in
//
//            make.top.equalTo(containView).offset(-200)
//            make.leading.equalTo(containView).offset(-50)
////            make.trailing.equalTo(containView).offset(-300)
//            make.height.equalTo(350)
//            make.width.equalTo(350)
//        }
//
//        pinkView.snp.makeConstraints { (make) in
//
//            make.top.equalTo(containView).offset(-150)
//            make.trailing.equalTo(containView).offset(150)
//            make.height.equalTo(400)
//            make.width.equalTo(400)
//        }
//
        
        
        
        
        containView.snp.makeConstraints { (make) in
            
            make.top.equalTo(view).inset(0)
            make.leading.equalTo(view).inset(0)
            make.trailing.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(0)
        }
        
//        titleLabel.snp.makeConstraints { (make) in
//            make.bottom.equalTo(containView).inset(100)
//            make.leading.equalTo(containView).offset(50)
//            make.trailing.equalTo(containView).offset(-50)
//            make.height.equalTo(30)
//
//        }
        avatarImage.snp.makeConstraints { (make) in

            make.top.equalTo(containView).offset(50)
            make.centerX.equalTo(containView)
            make.size.equalTo(CGSize(width: 100, height: 100))

        }
        emailLabel.snp.makeConstraints { (make) in
            
            make.bottom.equalTo(avatarImage).offset(50)
            make.leading.equalTo(containView).offset(30)
            make.trailing.equalTo(containView).offset(-30)
//            make.height.equalTo(30)
            
        }
        
        emailTxt.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabel).offset(30)
            make.leading.equalTo(emailLabel).offset(0)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
        }
        
        
        firstNameLabel.snp.makeConstraints { (make) in
            
            
            make.top.equalTo(emailTxt).offset(30)
            make.leading.equalTo(containView).offset(30)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        
        firstNameTxt.snp.makeConstraints { (make) in
            
            make.top.equalTo(firstNameLabel).offset(30)
            make.leading.equalTo(firstNameLabel).offset(0)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        
        
        lastNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstNameTxt).offset(30)
            make.leading.equalTo(firstNameTxt).offset(0)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        
        lastNameTxt.snp.makeConstraints { (make) in
            make.top.equalTo(lastNameLabel).offset(30)
            make.leading.equalTo(lastNameLabel).offset(0)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        fullNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lastNameTxt).offset(30)
            make.leading.equalTo(lastNameTxt).offset(0)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
        }
        fullNameTxt.snp.makeConstraints { (make) in
            make.top.equalTo(fullNameLabel).offset(30)
            make.leading.equalTo(fullNameLabel).offset(0)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        
        
        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fullNameTxt).offset(30)
            make.leading.equalTo(fullNameTxt).offset(0)
            make.trailing.equalTo(containView).offset(-30)
            make.height.equalTo(30)
            
        }
        
        passwordTxt.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabel).offset(30)
            make.leading.equalTo(passwordLabel).offset(0)
            make.trailing.equalTo(passwordLabel).offset(-30)
            make.height.equalTo(30)
            
        }
        
        registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTxt).offset(50)
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
    
}
