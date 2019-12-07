//
//  ProfileVC.swift
//  BookingApp
//
//  Created by Apple on 12/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    let cellReuseIdentifier = "cell"

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    let contentButton = ["Booking by Movie","Booking by Theater"]
    @IBOutlet weak var contentTableview: UITableView!
    @IBOutlet weak var avatarImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
            
        
        let token = AuthService.instance.authToken
        
        if token == nil{
        
            loginBtn.setTitle("Login", for: .normal)
        }else{
            loginBtn.setTitle("Log out", for: .normal)
        
        }
        UserApi.instance.getProfile { (user) in
            
            self.setupProfile(user: user!)
                   
        }
        
        avatarImage.cỉcleImage()
        contentTableview.delegate = self
        contentTableview.dataSource = self
        
        self.contentTableview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
//        UserApi.instance.getProfile { (user) in
//            print("user \(user?.email)")
//
//        }
        
        
    }
    

    @IBAction func loginBtnWasPressed(_ sender: Any) {
        
        let loginVC = LoginVC()
        
        present(loginVC, animated: true, completion: nil)
        
    }
    
    func setupProfile(user:User)  {
        
        self.nameLabel.text = user.fullName
        
        self.avatarImage.loadImageUsingCache(withUrl: user.avatar)
        
    }
    
 

}

extension ProfileVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?
        
        cell?.textLabel?.text = contentButton[indexPath.row]
        
        return cell!
       }


}
