//
//  BeerService.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 01/10/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class BeerService {
    
    static let shared = BeerService()
    private var manager: SessionManager
    
    init() {
        self.manager = Alamofire.SessionManager.default
    }
    func getBeerList(completion:@escaping ([Beer]?, Int, String?) -> ()) {
    
    let url: String = "https://api.punkapi.com/v2/beers?page=1&per_page=10"
    
    self.manager.request(url).responseJSON { response in
        if(response.response?.statusCode == 200) {
            let beers:[Beer] = Mapper<Beer>().mapArray(JSONArray: response.result.value as! [[String : Any]])
            
            completion(beers, 200, nil)
        }
        else {

        }
    }

    }
}
