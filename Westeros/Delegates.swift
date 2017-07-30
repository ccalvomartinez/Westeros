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
    
    static func peopleDelegate(model: [Person]) -> ArrayTableViewDelegate<Person>{
        return ArrayTableViewDelegate(model:model, viewMaker: {(person: Person, tableView: UITableView, navigationController: UINavigationController?) -> Void in
            
        })
    }
    
    static func seasonDelegate(model: [Season]) -> ArrayTableViewDelegate<Season>{
        return ArrayTableViewDelegate(model:model, viewMaker: {(season: Season, tableView: UITableView, navigationController: UINavigationController?) -> Void in
            let dataSource = DataSources.episodeDataSource(model: season.episodes)
            let delegate = Delegates.episodeDelegate(model: season.episodes)
            let arrayTableVC = ArrayTableViewController(dataSource: dataSource,
                                                        arrayDelegate: delegate,
                                                        title: "Episodes \(season.title)",
                                                        style: .plain)
            
            navigationController?.pushViewController(arrayTableVC, animated: true)
        })
    }
    
    static func episodeDelegate(model: [Episode]) -> ArrayTableViewDelegate<Episode>{
        return ArrayTableViewDelegate(model:model, viewMaker: {(episode: Episode, tableView: UITableView, navigationController: UINavigationController?) -> Void in
            
        })
    }
}
