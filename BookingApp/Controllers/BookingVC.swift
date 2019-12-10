//
//  BookingVC.swift
//  BookingApp
//
//  Created by Apple on 12/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import WebKit

class BookingVC: UIViewController,WKNavigationDelegate {
    
    var movieId:Int! = 0
    
    @IBOutlet weak var newsPageView: WKWebView!
    @IBOutlet weak var spinnner: UIActivityIndicatorView!
    override func viewDidLoad() {
        spinnner.startAnimating()
//        print("movie id \(movieId)")
        super.viewDidLoad()
        
        if movieId != nil{
                   DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                       self.spinnner.stopAnimating()
                    self.loadNewsPage(urlString: WEBURL+"\(String(describing: self.movieId!))")

                   })
                   
               }

        // Do any additional setup after loading the view.
    }
    
    
    func loadNewsPage(urlString:String)  {
        do{
            guard let url =  URL(string: urlString)  else {return}
//            spinnner.stopAnimating()
            let requestURL = try URLRequest(url: url, method: .get)
                  newsPageView.load(requestURL)
            
        }catch{
            debugPrint("errorr")
        }
      
    }
    
    
    
    func webView(_ webView: WKWebView,didStart navigation: WKNavigation!) {
           
           spinnner.startAnimating()
           
         }
         func webView(_ webView: WKWebView,didFinish navigation: WKNavigation!) {
            print("Page loaded")
           spinnner.stopAnimating()
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
