//
//  Hops.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 02/10/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct Hops: Mappable{
    var name: String?
    var amount: Volume?
    var add: String?
    var attribute: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name    <- map ["name"]
        amount  <- map["amount"]
        add     <- map["add"]
        attribute   <- map["attribute"]
    }
}


