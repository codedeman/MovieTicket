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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("What the fuck \(movieViewModel.movieData().count)")
        
        setupCollectionView()

        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
    }
    
    func setupCollectionView(){
    
        movieCollectionView.register(UINib(nibName:"HomeCell" , bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        
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
        return movieViewModel.movieData().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.HomeCell, for: indexPath) as? HomeCell  else {
            return HomeCell()
        }
        let data = movieViewModel.movieData()[indexPath.row]

        cell.configureCell(movie: data)
        return cell
    }



}
