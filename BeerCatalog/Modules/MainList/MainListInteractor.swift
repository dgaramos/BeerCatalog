//
//  MainListInteractor.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 01/10/18.
//  Copyright (c) 2018 Danilo Ramos. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import Alamofire

final class MainListInteractor {
    
    let _beerService = BeerService()
}

// MARK: - Extensions -

extension MainListInteractor: MainListInteractorInterface {
    func getBeerList(completion: @escaping ([Beer]?, Int, String?) -> ()) {
        _beerService.getBeerList(completion: completion)
    }
    
    
}
