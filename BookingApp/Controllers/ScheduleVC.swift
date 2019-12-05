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
    
    let underView:UIView = {
        let viewcontent = UIView()
        viewcontent.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return viewcontent
        
    }()
    
    let showtimeLabel:UILabel = {
        
        let label = UILabel()
        label.text = "English sub"
        label.textColor = .white
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize.init(width: 100, height: 100)
        flowLayout.scrollDirection = .horizontal
        self.showtimeCollectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: flowLayout)
    
        showtimeCollectionView.backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.2078431373, blue: 0.2784313725, alpha: 1)
        
        showtimeCollectionView.register(UINib(nibName: "ScheduleTimeCell", bundle: nil), forCellWithReuseIdentifier: "ScheduleTimeCell")
        
        showtimeCollectionView.delegate = self
        showtimeCollectionView.dataSource = self
        view.addSubview(contentView)
            setupView()
        
//        print("ididid \(id!)")
        
       


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        MovieApi.shared.getSchedule(id: id) { (schedule) in
                   self.arrSchedule = schedule!
                   self.showtimeCollectionView.reloadData()
            
        
            for items in schedule!{
            
                let str =  "2019-12-05T12:37:25.000+0000"
                
                let first =  str.firstIndex(of: "T")
                
                
//                2019-12-05T12:37:25.000+0000
                

                print("item \(first)")
                
            }
                
        }
        
        TheaterApi.shared.getTheater { (idTheater) in
            
//            print("id \(idTheater?.id)")
        }
//        AuditoriumApi.shared.getMovies(id: <#T##Int#>, completion: <#T##AuditoriumsreponseComletion##AuditoriumsreponseComletion##([Auditorium]?) -> Void#>)
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
        contentView.addSubview(showtimeCollectionView)
        
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
        
        showtimeCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(showtimeLabel).inset(50)
            make.leading.equalTo(contentView).inset(30)
            make.trailing.equalTo(contentView).inset(30)
            make.height.equalTo(100)
            
            
        }
        
        print("dit me \(arrSchedule.count)")
        
        
        

        
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

extension ScheduleVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return arrSchedule.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScheduleTimeCell", for: indexPath) as? ScheduleTimeCell else {return ScheduleTimeCell()}
        
        let schedule = arrSchedule[indexPath.row]
        cell.showtimeButton.setTitle(schedule.screeningTime, for: .normal)

        return cell

    }

}
