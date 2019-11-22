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

class HomeVC: UIViewController {

    var movieViewModel =  MovieViewModel()
    
    var homeviewModel = HomeViewModel()
    

    
    public var albums:BehaviorRelay<[Album]> = BehaviorRelay(value: [])
    private let disposeBag = DisposeBag()


    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    @IBOutlet weak var favoriteCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupCollectionView()
        homeviewModel.requestData()
        setupBindings()
        
    }
    
    func setupCollectionView(){
        
//        movieCollectionView.delegate = self
//        movieCollectionView.dataSource = self
//        favoriteCollection.delegate = self
//        favoriteCollection.dataSource = self
    
        
        
        
      
    
    }
    
    func setupBindings()  {
        
        let floawLayout = UPCarouselFlowLayout()
                    floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: (movieCollectionView?.frame.size.height)!)
                    floawLayout.scrollDirection = .horizontal
                    floawLayout.sideItemScale = 0.8
                    floawLayout.sideItemAlpha = 1.0
                    floawLayout.spacingMode = .fixed(spacing: 5.0)
                    movieCollectionView?.collectionViewLayout = floawLayout
        movieCollectionView.register(UINib(nibName:"HomeCell" , bundle: nil), forCellWithReuseIdentifier: "HomeCell")

        favoriteCollection.register(UINib(nibName: "TrendingMoviesCell", bundle: nil), forCellWithReuseIdentifier: "TrendingMoviesCell")
        
                
        homeviewModel.albums.bind(to: favoriteCollection.rx.items(cellIdentifier: "TrendingMoviesCell", cellType: TrendingMoviesCell.self)){ (index,album,cell) in
            cell.imageView.loadImage(fromURL: album.image)

        }.disposed(by: disposeBag)
        
        favoriteCollection.rx.modelSelected(Album.self).subscribe(onNext: { (album) in
            
            print("album \(album.image)")
        }).disposed(by: disposeBag)
        
        
        
        homeviewModel.albums.bind(to: movieCollectionView.rx.items(cellIdentifier: "HomeCell", cellType: HomeCell.self)) {(index,album,cell) in
            
            cell.movieImage.image = UIImage(systemName: album.image)
            
        }
 
        
    }
    

    

}

//extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        if collectionView == favoriteCollection{
//            return movieViewModel.movieData().count
//
//        }
//        return movieViewModel.movieData().count
//    }
//
//
//
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if collectionView == movieCollectionView{
//
//
//
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell  else {
//                return HomeCell()
//            }
//
//                let data = movieViewModel.movieData()[indexPath.row]
//
//                cell.configureCell(movie: data)
//                return cell
//
//        }else{
//
//            guard let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingMoviesCell", for: indexPath) as? TrendingMoviesCell else {
//                return TrendingMoviesCell()
//            }
//
//            let data1 = movieViewModel.movieData()[indexPath.row]
//
//            cell1.configureCell(movie: data1)
//
//            return cell1
//
//
//        }
//
//
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//
//        let moviedescription = VideoDescriptionVC()
//        present(moviedescription, animated: true) {
//
//        }
//
////        let storyboard  =  UIStoryboard(name: Segues.toMovieDescription, bundle: nil)
////
////
////        let movieDescription = storyboard.instantiateViewController(identifier: Segues.toMovieDescription)
////
////        present(movieDescription, animated: true) {
////
////            print("move movie description")
////        }
////
//
//
//
//      }
//
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////         if segue.identifier == Segues.toMovieDescription{
////             if let destination  = segue.destination as? VideoDescriptionVC{
//////                 destination.category = selectedCategory
////
////
////             }
////
////         }
////     }
//
//
//
//
//}
