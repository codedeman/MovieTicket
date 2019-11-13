//
//  MovieVC.swift
//  BookingApp
//
//  Created by Apple on 11/10/19.
//  Copyright © 2019 Apple. All rights reserved.
// Constraints

import UIKit

class HomeVC: UIViewController {

    var movieViewModel =  MovieViewModel()
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    @IBOutlet weak var favoriteCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("What the fuck \(movieViewModel.movieData().count)")
        
        setupCollectionView()

        
    }
    
    func setupCollectionView(){
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        favoriteCollection.delegate = self
        favoriteCollection.dataSource = self
    
        movieCollectionView.register(UINib(nibName:"HomeCell" , bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        favoriteCollection.register(UINib(nibName: Identifiers.TrendingMoviesCell, bundle: nil), forCellWithReuseIdentifier: Identifiers.TrendingMoviesCell)
        let floawLayout = UPCarouselFlowLayout()
              floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: (movieCollectionView?.frame.size.height)!)
              floawLayout.scrollDirection = .horizontal
              floawLayout.sideItemScale = 0.8
              floawLayout.sideItemAlpha = 1.0
              floawLayout.spacingMode = .fixed(spacing: 5.0)
              movieCollectionView?.collectionViewLayout = floawLayout
       
        
        
    
    }
    

    

}

extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == favoriteCollection{
            
            return movieViewModel.movieData().count
        
        }
        return movieViewModel.movieData().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == movieCollectionView{
        
        
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.HomeCell, for: indexPath) as? HomeCell  else {
                return HomeCell()
            }
            
                let data = movieViewModel.movieData()[indexPath.row]
        
                cell.configureCell(movie: data)
                return cell
        
        }else{
            
            guard let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.TrendingMoviesCell, for: indexPath) as? TrendingMoviesCell else {
                return TrendingMoviesCell()
            }
            
            let data1 = movieViewModel.movieData()[indexPath.row]
            
            cell1.configureCell(movie: data1)
            
            return cell1
            
            
        }
        

    }



}
