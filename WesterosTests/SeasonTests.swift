//
//  SeasonTests.swift
//  Westeros
//
//  Created by Administrador on 30/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import XCTest
@testable import Westeros
class SeasonTests: XCTestCase {
    
    var season1: Season!
    var season2: Season!
    var episodesS1: [Episode]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
         episodesS1 = [
            Episode(title: "Winter is coming", airDate:  Date.dateFromYearMonthDay(year:2011, month: 04, day: 17)),
            Episode(title: "The Kings Road", airDate:  Date.dateFromYearMonthDay(year:2011, month: 04, day: 24)),
            Episode(title: "Lord Snow", airDate:  Date.dateFromYearMonthDay(year:2011, month: 05, day: 1)),
            Episode(title: "Cripples, bastards, and broken things", airDate:  Date.dateFromYearMonthDay(year:2011, month: 05, day: 8))
                        ]
        season1 = Season(title: "Season 1", episodes: episodesS1, image: #imageLiteral(resourceName: "Game_of_Thrones_Season_1.jpg"))!
        
        let episodesS2 = [
            Episode(title: "The North remembers", airDate:  Date.dateFromYearMonthDay(year:2012, month: 04, day: 1)),
            Episode(title: "The Night Lands", airDate:  Date.dateFromYearMonthDay(year:2012, month: 04, day: 8)),
            Episode(title: "What is dead may never die", airDate:  Date.dateFromYearMonthDay(year:2012, month: 05, day: 15)),
            Episode(title: "Garden of bones", airDate:  Date.dateFromYearMonthDay(year:2012, month: 04, day: 22))

        ]
        
        season2=Season(title: "Season 2", episodes: episodesS2, image: #imageLiteral(resourceName: "Game_of_Thrones_Season_2.jpg"))!
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence(){
        
        XCTAssertNotNil(season1)
        
    }
    func  testCustomStringConvertible() {
        XCTAssertEqual("Season 1. 4 episode/s", season1.description)
    }
    
    func testSeasonEquality(){
        //Identidad
        XCTAssertEqual(season1, season1)
        
        //Igualdad
        let jinxed =  Season(title: "Season 1", episodes: episodesS1, image: #imageLiteral(resourceName: "Game_of_Thrones_Season_1.jpg"))!

        XCTAssertEqual(season1, jinxed)
        
        //Desigualdad
        XCTAssertNotEqual(season1, season2)
    }
    
    func testHasable(){
        XCTAssertNotNil(season1.hashValue)
        
    }
    
    func testSeasonCompare(){
        
        //Menor que
        XCTAssertTrue(season1 < season2)
        
        // Mayor que
        XCTAssertTrue(season2 > season1)
    }

    
}
