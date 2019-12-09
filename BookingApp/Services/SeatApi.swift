//
//  SeatApi.swift
//  BookingApp
//
//  Created by Apple on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

import SwiftyJSON
import Alamofire


class SeatApi {
    
    static let instance = SeatApi()
func getSeat(movieId:Int,scheduleId:Int,completion:@escaping SeatResponseCompletion){
        
        var arrLine = [String]()
        var arrRow = [Int]()
    
        var arrDic = [String:[Int]]()

        AF.request(URL_MOVIE+"/\(movieId)"+URL_SCHEDULE+"/\(scheduleId)/seats", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HTTPHeaders.init(BEARER_HEADER)).responseJSON { (response) in
            
            if response.error == nil{
                    
                guard let data = response.data else {return}
                let json = try! JSON(data: data).arrayValue
                
                for items in json{
                    
                    let seat = items["seats"].arrayValue
                    let line = items["line"].stringValue
                    arrLine.append(line)

                    for index in seat{
                        let row = index["isReserved"].intValue
                        arrRow.append(row)
                    }
                    
//
                }
                
                for index in arrLine{
                    arrDic.updateValue(arrRow, forKey: index)
                }
                
                    
                
                let seatcomplete = Seat(line: arrLine, isReserved: arrRow)
                if arrLine.count != 0{
                    let lineCinema = ["line":arrLine,"row":arrDic] as [String : Any]
                    NotificationCenter.default.post(name: .movieNotification, object: nil, userInfo: lineCinema)
                }
                completion(seatcomplete)
                
                
//                let lineCinema = ["line":arrSeat,"row":arrInt] as [String : Any]
//                NotificationCenter.default.post(name: .movieNotification, object: nil, userInfo: lineCinema)
//
                    

               
            }else{
                
//                completion(nil)
                debugPrint("error \(String(describing: response.error))")
            }
        }
    
    
    }
}
