//
//  MovieVC.swift
//  BookingApp
//
//  Created by Apple on 11/10/19.
//  Copyright © 2019 Apple. All rights reserved.
// Constraints

import UIKit
import RxCocoa
import RxSwift


protocol SendDetail {
    
    func sendData(id:Int,title:String,
    slug:String,
    director:String,
    cast:String,
    description:String,
    image:String,
    trailer:String,durationMin:Int,premiereAt:String,imdbScore:Float)
}

class HomeVC: UIViewController {
    var movieModel = [Movie]()
    var delegate: SendDetail?
    @IBOutlet weak var nowShowingButton: UIButton!
    private let disposeBag = DisposeBag()
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    @IBOutlet weak var favoriteCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated:animated)
        
        setupCollectionView()

        MovieApi.shared.getMovies { (movie) in
            
            for index in movie!{
                
                print("iiddi \(index.id)")
            }
            self.movieModel = movie!
//            print("id \()")
            self.movieCollectionView.reloadData()
            self.favoriteCollection.reloadData()
        }

    }
    
    
    
    func setupCollectionView(){
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        favoriteCollection.delegate = self
        favoriteCollection.dataSource = self
        let floawLayout = UPCarouselFlowLayout()
        floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: (movieCollectionView?.frame.size.height)!)
        floawLayout.scrollDirection = .horizontal
        floawLayout.sideItemScale = 0.8
        floawLayout.sideItemAlpha = 1.0
        floawLayout.spacingMode = .fixed(spacing: 5.0)
        movieCollectionView?.collectionViewLayout = floawLayout
        
        movieCollectionView.register(UINib(nibName:"HomeCell" , bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        
        favoriteCollection.register(UINib(nibName: "TrendingMoviesCell", bundle: nil), forCellWithReuseIdentifier: "TrendingMoviesCell")
        
    }
    
    func setupBindings()  {
        
        
    }
    
    

}

extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView == favoriteCollection{
            return movieModel.count

        }
        return movieModel.count
    }





    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == movieCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell  else {
                return HomeCell()
            }
                let data = movieModel[indexPath.row]
                cell.configureCell(movie: data)
                return cell
        }else{

            guard let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingMoviesCell", for: indexPath) as? TrendingMoviesCell else {
                return TrendingMoviesCell()
            }

            let data1 = movieModel[indexPath.row]
            cell1.configureCell(movie: data1)
            return cell1
        }


    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
        if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell {
            
            let movie = movieModel[indexPath.row]
            
//            delegate?.sendData(id: movie.id, title: movie.title, slug: movie.slug, director: movie.director, cast: movie.cast, description: movie.description, image: movie.image, trailer: movie.trailer, durationMin: movie.durationMin, premiereAt: movie.premiereAt, imdbScore: movie.imdbScore)
            
            let storyboard  =  UIStoryboard(name: "Main", bundle: nil)
                let mainVC = storyboard.instantiateViewController(identifier: "toMovieDescription") as! MovieDetailsVC
            
                    
            let arrDic = ["id":movie.id,"title":movie.title,"slug":movie.slug,"director":movie.director,"durationMin":movie.durationMin,"premiereAt": movie.premiereAt, "imdbScore": movie.imdbScore] as [String : Any]
            let test = ["title":1876]
            
                NotificationCenter.default.post(name: .movieNotification, object: nil, userInfo: test)
            navigationController?.pushViewController(mainVC, animated: true)
                
            
            
        }
        
        
        
 

      }






}
