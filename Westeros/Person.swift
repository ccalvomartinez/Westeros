//
//  Person.swift
//  Westeros
//
//  Created by Administrador on 6/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

final class Person{
    // MARK: Fiels
    let name: String
    let house: House
    private let _alias: String?
    
    // MARK: Properties
    var alias: String{
        get{
            //if let theAlias = _alias{
            //    return theAlias
            //}else{
            //    return ""
            //}
            return _alias ?? ""
            
        }
    }
    
    
    // MARK: Initializer
    init(name: String, alias: String, house: House) {
        
        (self.name, self._alias,self.house) = (name, alias, house)
    }
    
    init(name: String, house: House) {
        (self.name, self.house) = (name, house)
        _alias = nil
    }
}

extension Person{
    var fullName: String  {
        return "\(name) \(house.name)"
    }
    
}

extension Person{
    var proxy: String {
        return "\(name) \(alias) \(house.name)".lowercased()
    }
}
extension Person: Hashable, Equatable{
    var hashValue: Int {
        return proxy.hashValue
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Person: Comparable{
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }


}
