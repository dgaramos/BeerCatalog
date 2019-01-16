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
    
    func getBeerList(filter: BeerFilter, completion:@escaping ([Beer]?, Int, String?) -> ()) {
        var params = ["page" : filter.index, "per_page" : filter.length] as [String : Any]
        
        if (filter.beer_name != nil && filter.beer_name != "") {
            params["beer_name"] = filter.beer_name
        }
        
        Alamofire.request(Constants.API.beerURL, method: .get, parameters: params, encoding: URLEncoding.default).responseString {
            response in
            
            if (response.error != nil) {
                completion(nil, 0, response.error!.localizedDescription)
            } else {
                
                if (response.response?.statusCode == 200) {
                    let beerList = [Beer](JSONString: response.result.value!)
                    
                    if (beerList != nil) {
                        completion(beerList, (response.response?.statusCode)!, nil)
                    } else {
                        completion(nil, (response.response?.statusCode)!, "Erro ao carregar cortesias. Tente novamente.")
                    }
                    
                } else {
                    completion(nil, (response.response?.statusCode)!, "Erro ao carregar cortesias. Tente novamente.")
                }
            }
        }
    }
}
