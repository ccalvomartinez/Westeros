//
//  EpisodesTests.swift
//  Westeros
//
//  Created by Administrador on 30/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodesTests: XCTestCase {
    
    var episode1: Episode!
    var episode2: Episode!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        episode1 = Episode(title: "Winter is coming", airDate:  Date.dateFromYearMonthDay(year:2011, month: 04, day: 17))
        episode2 = Episode(title: "The Kings Road", airDate:  Date.dateFromYearMonthDay(year:2011, month: 04, day: 24))
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence(){
        
        XCTAssertNotNil(episode1)
        
    }
    func  testCustomStringConvertible() {
        XCTAssertEqual("Winter is coming.", episode1.description)
    }
    
    func testEpisodeEquality(){
        //Identidad
        XCTAssertEqual(episode1, episode1)
        
        //Igualdad
        let jinxed =  Episode(title: "Winter is coming", airDate:  Date.dateFromYearMonthDay(year:2011, month: 04, day: 17))
        
        XCTAssertEqual(episode1, jinxed)
        
        //Desigualdad
        XCTAssertNotEqual(episode1, episode2)
    }
    
    func testHasable(){
        XCTAssertNotNil(episode1.hashValue)
        
    }
    
    func testEpisodeCompare(){
        
        //Menor que
        XCTAssertTrue(episode1 < episode2)
        
        // Mayor que
        XCTAssertTrue(episode2 > episode1)
    }

    
}
