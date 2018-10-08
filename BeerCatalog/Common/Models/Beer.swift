//
//  Beer.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 02/10/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit

struct Beer: Mappable{
    
    var id: Int?
    var name: String?
    var tagline: String?
    var description: String?
    var image_url: String?
    var abv: Float?
    var ibu: Float?
    var target_fg: Float?
    var target_og: Float?
    var ebc: Float?
    var srm: Float?
    var ph: Float?
    var attenuation_level: Float?
    var volume: Volume?
    var boil_volume: BoilVolume?
    var method: Method?
    var ingredients: Ingredients?
    var food_pairing: [String]?
    var brewer_tips: String?
    var contributed_by: String?
    
    init(){
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id  <- map["id"]
        name  <- map["name"]
        tagline  <- map["tagline"]
        description  <- map["description"]
        image_url  <- map["image_url"]
        abv  <- map["abv"]
        ibu  <- map["ibu"]
        target_fg  <- map["target_fg"]
        target_og  <- map["target_og"]
        ebc  <- map["ebc"]
        srm  <- map["srm"]
        ph  <- map["ph"]
        attenuation_level  <- map["attenuation_level"]
        volume  <- map["volume"]
        boil_volume  <- map["boil_volume"]
        method  <- map["method"]
        ingredients  <- map["ingredients"]
        food_pairing  <- map["food_pairing"]
        brewer_tips  <- map["brewers_tips"]
        contributed_by  <- map["contributed_by"]
    }
}
