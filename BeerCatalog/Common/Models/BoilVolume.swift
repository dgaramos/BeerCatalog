//
//  BoilVolume.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 02/10/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct BoilVolume: Mappable{
    var value: Float?
    var unit: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        value <- map ["value"]
        unit <- map["unit"]
    }
}
