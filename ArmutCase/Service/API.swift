//
//  API.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 4.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit
//import Alamofire
import Alamofire


class API: NSObject {
    
    func getHome(callback:@escaping (DataResponse<MainResponse,AFError>,Error?) -> Void) {
        AF.request(Constant.kGetHomePageUrl).responseDecodable(of: MainResponse.self) { response in
            callback(response,nil)
        }
    }
    
    func getDetail(id:Int,callback:@escaping (DataResponse<DetailResponse,AFError>,Error?) -> Void){
        AF.request("\(Constant.kGetDetailUrl)\(id)").responseDecodable(of: DetailResponse.self) { response in
            callback(response,nil)
        }
    }
    
}
