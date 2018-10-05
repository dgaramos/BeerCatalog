//
//  ThemeInitializer.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 04/10/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import UIKit

class ThemeInitializer: Initializable {
    
    func performInitialization() {
        UINavigationBar.appearance(whenContainedInInstancesOf: [BeerCatalogNavigationController.self]).tintColor = .white
        UINavigationBar.appearance(whenContainedInInstancesOf: [BeerCatalogNavigationController.self]).barTintColor = UIColor.white
        UINavigationBar.appearance(whenContainedInInstancesOf: [BeerCatalogNavigationController.self]).titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
}

