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
import UIScrollView_InfiniteScroll
import SwiftGifOrigin

final class MainListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var list: [Beer] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filtersView: UIView!
    @IBOutlet weak var beerNameFilter: UITextField!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerCell
        let beer = list[indexPath.row]
        cell.beerName?.text = beer.name
        cell.tagLine?.text = beer.tagline
        cell.beerId?.text = String(beer.id ?? 0)
        cell.beerImage?.loadGif(name: "image-loader")
        Alamofire.request(beer.image_url ?? "https://www.brewdog.com/images/newshop/logo.png").responseImage { response in
            cell.beerImage?.image = response.result.value
        }           
        return cell
    }
    
    @IBAction func showHideFilters(_sender: Any) {
        if (self.filtersView.isHidden) {
            UIView.animate(withDuration: 0.3) {
                self.view.endEditing(true)
                self.filtersView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.view.endEditing(true)
                 SVProgressHUD.show(withStatus: "Searching beers!")
                self.presenter.addNameToFilter(name: (self.beerNameFilter.text?.formatFilter())!)
                self.filtersView.isHidden = true
            }
        }
    }


    // MARK: - Public properties -

    var presenter: MainListPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        SVProgressHUD.show(withStatus: "Loading beers!")
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        tableView.addInfiniteScroll { (tableView) -> Void in
            self.presenter.addIndexToFilter()
        }
        
        tableView.finishInfiniteScroll()
    }
	
}

// MARK: - Extensions -

extension MainListViewController: MainListViewInterface {
    func showErrorMessage(message: String) {
        
    }
    
    func setItems(index: Int, beerList: [Beer]) {
        if (index == 1) {
            list = beerList
        } else {
            list += beerList
        }
        tableView.reloadData()
        SVProgressHUD.dismiss()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(beer: list[indexPath.row])
    }
    
    func setViewTitle() {
        navigationItem.title = "Beer Catalog"
    }
    
}
