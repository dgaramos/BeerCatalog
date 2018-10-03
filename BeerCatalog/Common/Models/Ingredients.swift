//
//  Ingredients.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 02/10/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct Ingredients: Mappable{
    var malt: [Malt]?
    var hops: [Hops]?
    var yeast: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        malt <- map ["malt"]
        hops <- map["hops"]
        yeast <- map["yeast"]
    }
}
