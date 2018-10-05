//
//  BeerDetailsViewController.swift
//  
//
//  Created by Danilo Ramos on 04/10/18.
//  Copyright (c) 2018 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class BeerDetailsViewController: UIViewController {

    
    // MARK: - Public properties -

    var presenter: BeerDetailsPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension BeerDetailsViewController: BeerDetailsViewInterface {
    
    func setViewTitle(_ title: String?){
        navigationItem.title = title
    }
}
