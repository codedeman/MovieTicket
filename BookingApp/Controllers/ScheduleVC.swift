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

    
    let calenderView: CalenderView = {
        
        
          let v=CalenderView(theme: MyTheme.dark)
          v.translatesAutoresizingMaskIntoConstraints=false
          return v
      }()
    
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
    override func loadView() {
    super.loadView()
        
        
//        cellLayout.scrollDirection = .horizontal
//        cellLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//        cellLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 185 + 80)
        
//
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        showtimeCollectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 2000))
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize.init(width: 100, height: 100)
        flowLayout.scrollDirection = .horizontal
        self.showtimeCollectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: flowLayout)
    
        showtimeCollectionView.backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.2078431373, blue: 0.2784313725, alpha: 1)
        
//        showtimeCollectionView.delegate =  self
//        showtimeCollectionView.dataSource = self
        
        view.addSubview(contentView)
            setupView()


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TheaterApi.shared.getTheater { (idTheater) in
            
            print("id \(idTheater?.id)")
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

//extension ScheduleVC:UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Celll", for: indexPath) as? ScheduleCell else {return ScheduleCell()}
//
//
//        return cell
//
//
//
//
//    }
//
//
//
//
//}
