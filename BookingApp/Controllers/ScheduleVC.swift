//
//  ScheduleVC.swift
//  BookingApp
//
//  Created by Apple on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SnapKit
class ScheduleVC: UIViewController {

    var arrSchedule = [Schedules]()
    var arrAuditorium = [Auditorium]()
    var arrTheater = [Theaters]()
    let calenderView: CalenderView = {
          let v=CalenderView(theme: MyTheme.dark)
          v.translatesAutoresizingMaskIntoConstraints=false
          return v
      }()
    
    var id:Int! = 0
    var showtimeCollectionView:
        UICollectionView!
    
    let cellLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    let contentView:UIView = {
        let viewcontent = UIView()
        viewcontent.backgroundColor = #colorLiteral(red: 0.1663910151, green: 0.1400647461, blue: 0.1885524392, alpha: 1)
        return viewcontent
        
    }()
    var theaterTableView:UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.2078431373, blue: 0.2784313725, alpha: 1)
        return tableview
        
    }()
    
    let underView:UIView = {
        let viewcontent = UIView()
        viewcontent.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return viewcontent
        
    }()
    
    let theaterLabel:UILabel = {
            
        let label = UILabel()
        label.text = "English sub"
        label.textColor = .white
        return label
    
    }()
    
    let showtimeLabel:UILabel = {
        
        let label = UILabel()
        label.text = "Rap chiếu phim"
        label.textColor = .white
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize.init(width: 100, height: 100)
        flowLayout.scrollDirection = .horizontal
        self.showtimeCollectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: flowLayout)
        
        theaterTableView.backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.2078431373, blue: 0.2784313725, alpha: 1)
        theaterTableView.contentSize  = CGSize(width: self.view.bounds.width, height: 2000)
        self.theaterTableView = UITableView.init(frame: CGRect(x: 20, y: 10, width: 100, height: 300))
        
        
        
        theaterTableView.register(UINib(nibName: "TheaterCell", bundle: nil), forCellReuseIdentifier: "TheaterCell")
        theaterTableView.delegate = self
        theaterTableView.dataSource = self
        view.addSubview(contentView)
            setupView()
        
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        MovieApi.shared.getSchedule(id: id) { (schedule) in
            self.arrSchedule = schedule!
            self.showtimeCollectionView.reloadData()
            
            for items in schedule!{
                print("id auditoriumId \(items.auditoriumId)")
            
            }

        }
        
        TheaterApi.shared.getTheater { (theater) in
            
            print("id theater \(String(describing: theater?.id))")
            AuditoriumApi.shared.getAuditorium(id: theater!.id) { (auditorium) in
                self.arrAuditorium = auditorium!
                self.theaterTableView.reloadData()
            }
            
        }
    }
    
    func setupView(){
        
        contentView.snp.makeConstraints { (make) in

            make.leading.equalTo(view).offset(0)
            make.trailing.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(0)
            make.top.equalTo(view).offset(0)
        }
//
        contentView.addSubview(calenderView)
        contentView.addSubview(underView)
        contentView.addSubview(showtimeLabel)
        contentView.addSubview(theaterTableView)
        
        calenderView.snp.makeConstraints { (make) in
            
            make.top.equalTo(contentView).inset(50)
            make.leading.equalTo(contentView).inset(0)
            make.trailing.equalTo(contentView).inset(0)
            make.height.equalTo(150)
            
        }
        underView.snp.makeConstraints { (make) in
            make.top.equalTo(calenderView).inset(150)
            make.leading.equalTo(contentView).inset(30)
            make.trailing.equalTo(contentView).inset(30)
            make.height.equalTo(1)
            
        }
        
        showtimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(underView).inset(30)
            make.leading.equalTo(contentView).inset(30)
            make.trailing.equalTo(contentView).inset(30)
            make.height.equalTo(30)
            
        }
        
        theaterTableView.snp.makeConstraints { (make) in
            make.top.equalTo(showtimeLabel).inset(50)
            make.leading.equalTo(contentView).inset(30)
            make.trailing.equalTo(contentView).inset(30)
            make.height.equalTo(300)
            
        }
        
 
    }
    

   

}


extension ScheduleVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrAuditorium.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TheaterCell") as? TheaterCell else {return TheaterCell()}
        
        let data = arrAuditorium[indexPath.row]
        
        cell.configureCell(auditorium: data, id: id)
        cell.delegate = self
//        cell.delegate = self as! ScheduleCellDelegate as! TheaterDelegate
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("i'm here")
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }


}

extension ScheduleVC:TheaterDelegate{
    func sendDataBack(schedule: Schedules) {
        print("here here")
    }
    
//    func didTapShowTime(time: Schedules) {
//        print("aAA")
//    }
//
//    func sendDataBack(schedule: Schedules) {
//
//        print("what the fuck\(schedule.auditoriumId)")
//    }
    
   
    


}
