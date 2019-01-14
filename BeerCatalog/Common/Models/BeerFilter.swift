//
//  BeerFilter.swift
//  BeerCatalog
//
//  Created by Danilo Gonçalves Alves Ramos on 14/01/19.
//  Copyright © 2019 Danilo Ramos. All rights reserved.
//

import Foundation
import ObjectMapper


struct BeerFilter: Mappable{
    var index: Int?
    var length: Int?
    
    init?(map: Map) {
        
    }
    
    init(index: Int, length: Int) {
        self.index = index
        self.length = length
    }
    
    mutating func mapping(map: Map) {
        index <- map ["index"]
        length <- map["length"]
    }
}
