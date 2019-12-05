//
//  ProfileVC.swift
//  BookingApp
//
//  Created by Apple on 12/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    let contentButton = ["Booking by Movie","Booking by Theater"]
    @IBOutlet weak var contentTableview: UITableView!
    @IBOutlet weak var avatarImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.cỉcleImage()

        // Do any additional setup after loading the view.
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

extension ProfileVC:UITableViewDelegate,UITableViewDataSource{
   
    
   
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.textLabel?.text = contentButton[indexPath.row]
        
        return cell
       }


}
