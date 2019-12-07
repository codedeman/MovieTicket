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
    
    
    @IBOutlet weak var checkoutButton: UIButton? = {
    
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.3098039216, blue: 0.3294117647, alpha: 1)
        button.tintColor = .white
        return button
        
        
    }()
    var classTitle = ["Platinum","Gold","Silver"]

    var seatLayout = ["Platinum":[1,1,1,1,1,1,1,2,2,1,1,1,],"Gold":[2,1,1,1,1,1,1,2,2,2,2,1,2,2,1,1,1,1,1,2,2,1,1,2,2,1,1,1,1,1,1,2,2,2,2,1],"Silver":[1,1,1,1,1,1,1,2,2,1,1,1,1,1,1,1,1,1,1,2,2,1,1,1,1,1,1,1,1,1,1,2,2,1,1,1,0,1,1,1,2,1,1,1,1,2,2,0,0,1,2,2,2,2,1,1,1,2,1,0,0,2,2,1,1,1,2,2,2,2,2,0]]
    var seatCount: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        seatLabel.textColor = .white
        
        seatCollectionView.delegate = self
        seatCollectionView.dataSource = self
        seatCollectionView.backgroundColor   = #colorLiteral(red: 0.1990531087, green: 0.1608822048, blue: 0.2323940694, alpha: 1)
        
        checkoutButton?.tintColor = .white
        checkoutButton?.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.3098039216, blue: 0.3294117647, alpha: 1)
    }
    
   
//
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SeatVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return classTitle.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return (seatLayout[classTitle[section]]?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatCell
        if seatLayout[classTitle[indexPath.section]]![indexPath.row] == 0 {
            cell.seat.image = nil
        }else if seatLayout[classTitle[indexPath.section]]![indexPath.row] == 1 {
            cell.seat.image = #imageLiteral(resourceName: "square2")
        }else if seatLayout[classTitle[indexPath.section]]![indexPath.row] == 2 {
            cell.seat.image = #imageLiteral(resourceName: "square2")
        }else{
            cell.seat.image = #imageLiteral(resourceName: "icons8-square-24.png")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let deviceWidth = (view.frame.width/12)-10
           return CGSize(width: deviceWidth, height: deviceWidth)
       }
    
    
   
    
    
    
    


    
}
