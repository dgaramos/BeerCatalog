//
//  ViewController.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 30/09/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let list = ["Leite", "Ovos", "Pão", "Banana", "Açucar"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SVProgressHUD.setDefaultMaskType(.black)
        //SVProgressHUD.show(withStatus: "ETA POORRA")
    }


}

