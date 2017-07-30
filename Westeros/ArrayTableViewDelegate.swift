//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Administrador on 20/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//


import UIKit

final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate{
    
    typealias Elements = [Element]
     typealias ViewMaker = (Element, UITableView, UINavigationController?)->Void
    
    private let _model : Elements
    private weak var _myTableController: UITableViewController?
    private let _viewMaker: ViewMaker
    
    init(model: Elements,  viewMaker: @escaping ViewMaker){
        self._model = model
        _viewMaker = viewMaker
              super.init()
        
    }
    public func setTableController(tableController: UITableViewController){
        _myTableController = tableController

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let elt = _model[indexPath.row]
         _viewMaker(elt, tableView, _myTableController?.navigationController)
        

        
    }
    
}
