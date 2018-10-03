//
//  MashTemp.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 02/10/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct MashTemp: Mappable{
    var temp: Temperature?
    var duration: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        temp <- map ["temp"]
        duration <- map["duration"]
    }
}

