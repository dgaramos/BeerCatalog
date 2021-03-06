//
//  BeerDetailsWireframe.swift
//  
//
//  Created by Danilo Ramos on 04/10/18.
//  Copyright (c) 2018 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class BeerDetailsWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = UIStoryboard(name: "BeerDetails", bundle: nil)

    // MARK: - Module setup -

    init(beer: Beer) {
        let moduleViewController = _storyboard.instantiateViewController(ofType: BeerDetailsViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = BeerDetailsInteractor()
        let presenter = BeerDetailsPresenter(wireframe: self, view: moduleViewController, interactor: interactor, beer: beer)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension BeerDetailsWireframe: BeerDetailsWireframeInterface {

    func navigate(to option: BeerDetailsNavigationOption) {
    }
}
