//
//  SeatVC.swift
//  BookingApp
//
//  Created by Apple on 11/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SeatVC: UIViewController{

    @IBOutlet weak var seatCollectionView: UICollectionView!
    @IBOutlet weak var seatLabel: UILabel!
    var seatModel = [Seat]()
    var seatSelection:Seat!
    var arrSeat = [Int]()

    @IBOutlet weak var checkoutButton: UIButton? = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.3098039216, blue: 0.3294117647, alpha: 1)
        button.tintColor = .white
        return button
        
    }()
    var classTitle = [String]()
    var seatLayout = [String:[Int]]()
    var seatLayout2 = [String:[Int]]()
    var seatCount: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        seatLabel.textColor = .white
        seatCollectionView.delegate = self
        seatCollectionView.dataSource = self
        seatCollectionView.backgroundColor   = #colorLiteral(red: 0.1990531087, green: 0.1608822048, blue: 0.2323940694, alpha: 1)
        checkoutButton?.tintColor = .white
        checkoutButton?.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.3098039216, blue: 0.3294117647, alpha: 1)
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: .movieNotification, object: nil)
        
        
        SeatApi.instance.getSeat(movieId: 2, scheduleId: 276) { (seat) in
            
                self.seatCollectionView.reloadData()
        }
        
       
    }
    @objc func getData(notification:Notification){
        
        let  line  = notification.userInfo?["line"] as! [String]
        classTitle  = line
        
        let row = notification.userInfo?["row"]
        
        seatLayout = row as! [String : [Int]]

    }
   
    
    func getSeat()->[String:[Int]]{
        
        var arr:[String:[Int]]
        for index in classTitle{
            
            print("index \(index)")
        }
        return seatLayout
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
     
        
    }
    
 
        
}


    


extension SeatVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatCell
//
//
//        return cell
//
//    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {

        
        return classTitle.count
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return (seatLayout[classTitle[section]]?.count)!

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatCell
        
//        print("dm \(seatLayout[classTitle[indexPath.section]]![indexPath.row])")
        if seatLayout[classTitle[indexPath.section]]![indexPath.row] == 0 {
            
            cell.seat.image =  UIImage(named: "square2")
        }
        
        else if seatLayout[classTitle[indexPath.section]]![indexPath.row] == 1 {
            cell.seat.image = #imageLiteral(resourceName: "square2")
        }
        

        return cell
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let deviceWidth = (view.frame.width/10)-20
           return CGSize(width: deviceWidth, height: deviceWidth)
       }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatCell

        
        if seatLayout[classTitle[indexPath.section]]![indexPath.row] == 0 {
            
            seatCount += 1
            
            
            if seatCount > 3{
                
                simpleAlert(title: "Cảnh báo ", msg: "Không chọn quá ba gế")
                
                
            }else{
                
                
                
            }
//            print("\(seatCount)")
            
            
        }
        
       

        
        

    }










}
