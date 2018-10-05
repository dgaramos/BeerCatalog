//
//  BeerDetailsInterfaces.swift
//  
//
//  Created by Danilo Ramos on 04/10/18.
//  Copyright (c) 2018 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum BeerDetailsNavigationOption {
}

protocol BeerDetailsWireframeInterface: WireframeInterface {
    func navigate(to option: BeerDetailsNavigationOption)
}

protocol BeerDetailsViewInterface: ViewInterface {
    func setViewTitle(_ title: String?)
}

protocol BeerDetailsPresenterInterface: PresenterInterface {
    func viewDidLoad()
}

protocol BeerDetailsInteractorInterface: InteractorInterface {
}
