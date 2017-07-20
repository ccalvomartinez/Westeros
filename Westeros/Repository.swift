//
//  Repository.swift
//  Westeros
//
//  Created by Administrador on 16/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation


final class Repository{
    static let local = LocalFactory()
}

protocol HouseFactory {
    typealias Filter = (House)->Bool
    
    var houses: [House] {get}
    
    func house(name: String) -> House?
    
    func filteredHouses(filteredBy: Filter) -> [House]
}

final class LocalFactory{
    var houses: [House]{
        get
        {
            // Aquí es donde se crean las casas
            
            // Sigils
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Stark_escudo.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Lannister_escudo.png"), description: "Rampant lion")
            let mormontSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Mormont.png"), description: "Rampant bear")
            let greyjoySigil = Sigil(image: #imageLiteral(resourceName: "Casa_Greyjoy_escudo.png"), description: "A golden kraken on a black field")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Targaryen_estandarte.png"), description: "A red three-headed dragon")
            let tyrellSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Tyrell.png"), description: "A golden rose on a green field")
            
            // URLs
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let mormontURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Mormont")!
            let greyjoyURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let tyrrelURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Tyrrel")!

            // Houses
            let stark       = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: starkURL)
            let lannister   = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!",url: lannisterURL)
            let mormont     = House(name: "Mormont", sigil: mormontSigil, words: "Here we stand!", url: mormontURL)
            let greyjoy     = House(name: "Greyjoy", sigil: greyjoySigil, words: "We Do Not Sow", url: greyjoyURL)
            let targaryen   = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and Blood", url: targaryenURL)
            let tyrell      = House(name: "Tyrell", sigil: tyrellSigil, words: "Growing Strong", url: tyrrelURL)
            
            // Stark
            let robb    = Person(name: "Robb", alias: "The young wolf", house: stark)
            let sansa   = Person(name: "Sansa", alias: "Little bird", house: stark)
            let arya    = Person(name: "Arya", house: stark)
            let brandon = Person(name: "Brandon", alias: "The winged wolf", house: stark)
            let rickon  = Person(name: "Rickon", house: stark)
            
            stark.add(person: robb)
            stark.add(person: sansa)
            stark.add(person: arya)
            stark.add(person: brandon)
            stark.add(person: rickon)
            
            
            // ---- Lannister ----
            let tyrion  = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime   = Person(name: "Jaime", alias: "KingSlayer", house: lannister)
            let cersei   = Person(name: "Cersei", house: lannister)
            
            lannister.add(person: tyrion)
            lannister.add(person: jaime)
            lannister.add(person: cersei)
            
            // ---- Mormont ----
            let lyanna  = Person(name: "Lyanna", house: mormont)
            
            mormont.add(person: lyanna)
            
            // ---- Greyjoy ----
            let asha  = Person(name: "Asha", alias: "Esgred", house: greyjoy)
            let theon  = Person(name: "Theon", alias: "Reek", house: greyjoy)
            
            greyjoy.add(person: asha)
            greyjoy.add(person: theon)
            
            return [stark, lannister,mormont, greyjoy, targaryen, tyrell].sorted()
            
        }
       
    }
    func house(name: String) -> House?{
        return houses.first(where: {$0.name.uppercased() == name.uppercased()})
    }
    
    func filteredHouses(filteredBy: (House) -> Bool) -> [House] {
        return houses.filter(filteredBy)
    }
}
