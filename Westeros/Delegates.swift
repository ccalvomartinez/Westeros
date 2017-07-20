//
//  Delegates.swift
//  Westeros
//
//  Created by Administrador on 20/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

final class Delegates{
    
    static func housesDelegate(model: [House])->ArrayTableViewDelegate<House>{
        
        // Qué va aqui???
        return ArrayTableViewDelegate(model: model,  viewMaker: { (house: House, tableView: UITableView, navigationController: UINavigationController?) -> Void in
            let houseVC = HouseViewController(model: house)
            
            // Hacemos un push al navigator controler
            
            navigationController?.pushViewController(houseVC, animated: true)

        
        })
    }
}
