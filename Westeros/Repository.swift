//
//  Repository.swift
//  Westeros
//
//  Created by Administrador on 16/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation


final class Repository{
    static let local = LocalRepository()
}

protocol RepositoryFactory {
    associatedtype Element
    typealias Filter = (Element)->Bool
    
    var elements: [Element] {get}
    
    func element(withName name: String) -> Element?
    
    func filteredElements(filteredBy: Filter) -> [Element]
}


final class LocalRepository{
    let housesFactory: LocalHouseFactory
    let seasonsFactory: LocalSeasonFactory
    
    init() {
        housesFactory = LocalHouseFactory()
        seasonsFactory = LocalSeasonFactory()
    }
}

final class LocalHouseFactory: RepositoryFactory{
    typealias Element = House
    var elements: [House]{
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
    func element(withName name: String) -> House? {
        return elements.first(where: {$0.name.uppercased() == name.uppercased()})
    }
    
    func filteredElements(filteredBy: (House) -> Bool) -> [House] {
        return elements.filter(filteredBy)
    }

}

final class LocalSeasonFactory: RepositoryFactory{
    typealias Element = Season
    
    var elements: [Season]{
        get{
            let episodesS1 = [
                Episode(title: "Winter is coming", airDate:  Date.dateFromYearMonthDay(year:2011, month: 04, day: 17)),
                Episode(title: "The Kings Road", airDate:  Date.dateFromYearMonthDay(year:2011, month: 04, day: 24)),
                Episode(title: "Lord Snow", airDate:  Date.dateFromYearMonthDay(year:2011, month: 05, day: 1)),
                Episode(title: "Cripples, bastards, and broken things", airDate:  Date.dateFromYearMonthDay(year:2011, month: 05, day: 8))
            ]
            let season1 = Season(title: "Season 1", episodes: episodesS1, image: #imageLiteral(resourceName: "Game_of_Thrones_Season_1.jpg"))!
            
            let episodesS2 = [
                Episode(title: "The North remembers", airDate:  Date.dateFromYearMonthDay(year:2012, month: 04, day: 1)),
                Episode(title: "The Night Lands", airDate:  Date.dateFromYearMonthDay(year:2012, month: 04, day: 8)),
                Episode(title: "What is dead may never die", airDate:  Date.dateFromYearMonthDay(year:2012, month: 04, day: 15)),
                Episode(title: "Garden of bones", airDate:  Date.dateFromYearMonthDay(year:2012, month: 04, day: 22))
                
            ]
            
            let season2=Season(title: "Season 2", episodes: episodesS2, image: #imageLiteral(resourceName: "Game_of_Thrones_Season_2.jpg"))!
            
            let episodesS3 = [
                Episode(title: "Valar Dohaeris", airDate:  Date.dateFromYearMonthDay(year:2013, month: 03, day: 31)),
                Episode(title: "Dark wings, dark words", airDate:  Date.dateFromYearMonthDay(year:2013, month: 04, day: 7)),
                Episode(title: "Walk of punishment", airDate:  Date.dateFromYearMonthDay(year:2013, month: 04, day: 14)),
                Episode(title: "And now his watch is ended", airDate:  Date.dateFromYearMonthDay(year:2013, month: 04, day: 21))
            ]
            
            let season3=Season(title: "Season 3", episodes: episodesS3, image: #imageLiteral(resourceName: "Game_of_Thrones_Season_3.jpg"))!

            let episodesS4 = [
                Episode(title: "Two swords", airDate:  Date.dateFromYearMonthDay(year:2014, month: 04, day: 06)),
                Episode(title: "The lion and the rose", airDate:  Date.dateFromYearMonthDay(year:2014, month: 04, day: 13)),
                Episode(title: "Breaker of chains", airDate:  Date.dateFromYearMonthDay(year:2014, month: 04, day: 20)),
                Episode(title: "Oathkeeper", airDate:  Date.dateFromYearMonthDay(year:2014, month: 04, day: 27))
            ]
            
            let season4=Season(title: "Season 4", episodes: episodesS4, image: #imageLiteral(resourceName: "Game_of_Thrones_Season_4.jpg"))!
            
            let episodesS5 = [
                Episode(title: "The wars to come", airDate:  Date.dateFromYearMonthDay(year:2015, month: 04, day: 12)),
                Episode(title: "The house of black and white", airDate:  Date.dateFromYearMonthDay(year:2015, month: 04, day: 19)),
                Episode(title: "High sparrow", airDate:  Date.dateFromYearMonthDay(year:2015, month: 04, day: 26)),
                Episode(title: "Sons of the harpy", airDate:  Date.dateFromYearMonthDay(year:2015, month: 05, day: 3))
            ]
            
            let season5=Season(title: "Season 5", episodes: episodesS5, image: #imageLiteral(resourceName: "Game_of_Thrones_Season_5.png"))!
            
            let episodesS6 = [
                Episode(title: "The red woman", airDate:  Date.dateFromYearMonthDay(year:2016, month: 04, day: 24)),
                Episode(title: "Home", airDate:  Date.dateFromYearMonthDay(year:2016, month: 05, day: 1)),
                Episode(title: "Oathbreaker", airDate:  Date.dateFromYearMonthDay(year:2016, month: 05, day: 8)),
                Episode(title: "Book of the starnger", airDate:  Date.dateFromYearMonthDay(year:2016, month: 05, day: 15))
            ]
            
            let season6=Season(title: "Season 6", episodes: episodesS6, image: #imageLiteral(resourceName: "Game_of_Thrones_Season_6.jpeg"))!
            
            return [season1, season2, season3, season4, season5, season6].sorted()

        }
    }
    
    func element(withName name: String) -> Season? {
        return elements.first(where: {$0.title.uppercased() == name.uppercased()})
    }
    
    func filteredElements(filteredBy: (Season) -> Bool) -> [Season] {
         return elements.filter(filteredBy)
    }

    

}

