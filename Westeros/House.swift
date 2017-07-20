//
//  House.swift
//  Westeros
//
//  Created by Administrador on 6/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit


typealias Words = String
typealias Members = Set<Person>

final class House  {
    let name: String
    let sigil: Sigil
    let words: Words
    let wiki: URL
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words, url: URL) {
        self.name = name
        self.sigil = sigil
        self.words = words
        self.wiki = url
        _members = Set<Person>()
    }
}

extension House{
    var count: Int{
        return _members.count
    }

    func add(person: Person) {
        
        guard person.house.name == name else{
            return
        }
        _members.insert(person)
    }
    // Variadica (Person... es equivalente a params)
    func add(persons: Person...) {
        for person in persons {
            add(person: person)
        }
    }
    
    func sortedMembers() -> [Person] {
        let membersArray = Array(_members)
        return membersArray.sorted()
    }
}
// MARK: Basic Protocols - Hashable, Equatable, Comparable
extension House: Hashable, Equatable{
    var hashValue: Int {
        return "\(name) \(sigil.hashValue) \(words.hashValue)".hashValue
    }
    
    static func ==(lhs: House, rhs: House) -> Bool {
        return (lhs.name, lhs.sigil, lhs.words) == (rhs.name, rhs.sigil, rhs.words)
    }

}
extension House: Comparable{
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.name.lowercased() < rhs.name.lowercased()
    }


}

// MARK: Class Sigil
final class Sigil{
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String){
        
        self.description=description
        self.image = image
    }
}

extension Sigil: Hashable{
    var hashValue: Int {
        
        return ("\(description) \(image.hashValue)").hashValue
    }
    
    static func ==(lhs: Sigil, rhs: Sigil) -> Bool {
        return (lhs.description, lhs.image) == (rhs.description, rhs.image)
    }


}
