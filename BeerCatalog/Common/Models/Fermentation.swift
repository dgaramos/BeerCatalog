//
//  Fermentation.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 02/10/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct Fermentation: Mappable{
    var temp: Temperature?
    var twist: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        temp <- map ["temp"]
        twist <- map["twist"]
    }
}
