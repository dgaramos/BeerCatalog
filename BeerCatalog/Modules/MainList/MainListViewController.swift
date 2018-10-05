//
//  MainListViewController.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 01/10/18.
//  Copyright (c) 2018 Danilo Ramos. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import Alamofire
import AlamofireImage
import SVProgressHUD

final class MainListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var list: [Beer] = []
    @IBOutlet weak var tableView: UITableView!
    
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return(list.count)
        }
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerCell
            let beer = list[indexPath.row]
            cell.beerName?.text = beer.name
            cell.tagLine?.text = beer.tagline
            cell.beerId?.text = String(beer.id ?? 0)
            
            Alamofire.request(beer.image_url ?? "https://www.brewdog.com/images/newshop/logo.png").responseImage { response in
                cell.beerImage?.image = response.result.value
            }
            
            return(cell)
        }
    

    // MARK: - Public properties -

    var presenter: MainListPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        SVProgressHUD.show(withStatus: "Loading beers!")
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension MainListViewController: MainListViewInterface {
    func showErrorMessage(message: String) {
        
    }
    
    func setItems(beerList: [Beer]) {
        list = beerList
        tableView.reloadData()
        SVProgressHUD.dismiss()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(beer: list[indexPath.row])
    }
    
    func setViewTitle(){
        navigationItem.title = "Beer Catalog"
    }
    
}
