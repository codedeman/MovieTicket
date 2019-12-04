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

    @IBOutlet weak var nowShowingButton: UIButton!
    
    private let disposeBag = DisposeBag()

    var movieModel = [Movie]()
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    @IBOutlet weak var favoriteCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        MovieApi.shared.getMovies { (movie) in
            
            self.movieModel = movie!
            self.movieCollectionView.reloadData()
            self.favoriteCollection.reloadData()
            
        }
        test()
        
        
    }
    
    func test() {
        
        nowShowingButton.rx.tap.asDriver().throttle(2).drive(onNext: { (text) in
            print("what the hell \(text)")
        }, onCompleted: nil).disposed(by: disposeBag)
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

//
//
        let storyboard  =  UIStoryboard(name: "Main", bundle: nil)
//
//
        let movieDescription = storyboard.instantiateViewController(identifier: "toMovieDescription")
//
        present(movieDescription, animated: true, completion: nil)
        
//        performSegue(withIdentifier:"toDetailMovie" , sender: nil)


      }






}
