//
//  Method.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 02/10/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct Method: Mappable{
    var mash_temp: [MashTemp]?
    var fermentation: Fermentation?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        mash_temp <- map ["mash_temp"]
        fermentation <- map["fermentation"]
    }
}

