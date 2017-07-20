//
//  HousesTableViewController.swift
//  Westeros
//
//  Created by Administrador on 17/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

class HousesTableViewController: UITableViewController {
    // MARK: - Fields
    let houses: [House]
    
    // MARK: - Init
    init(model: [House], style: UITableViewStyle) {
        self.houses = model
        super.init(style: style)
        title = "Westeros world"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return houses.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Houses"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let returnCell: UITableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        
        if let cell = cell {
            returnCell  = cell
        }
        else{
            returnCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "reuseIdentifier")
        }
        
        
        // Sincronizar modelo y vista
        let house = houses[indexPath.row]
        
        returnCell.textLabel?.text = house.name
        returnCell.detailTextLabel?.text = house.words
        returnCell.imageView?.image = house.sigil.image
        
        
        return returnCell
    }
    // MARK: - Table Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Obtenemos el modelo
        
        let house = houses[indexPath.row]
        
        //Creamos un house controller
        
        let houseVC = HouseViewController(model: house)
        
        // Hacemos un push al navigator controler
        
        self.navigationController?.pushViewController(houseVC, animated: true)
    }
    
}
