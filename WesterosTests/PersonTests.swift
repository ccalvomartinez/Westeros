//
//  PersonTest.swift
//  Westeros
//
//  Created by Administrador on 6/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var rob: Person!
    var arya: Person!
    var tyrion: Person!
    
    
    override func setUp() {
        super.setUp()
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Stark_escudo.png"), description: "Direwolf")
        starkHouse = House(name:"Stark", sigil: starkSigil, words: "Winter is coming", url: starkURL)
        rob = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        
        lannisterSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Lannister_escudo.png"), description: "Rampant Lion")
        lannisterHouse = House(name:"Lannister", sigil: lannisterSigil, words: "Hear me roar", url: lannisterURL)
        tyrion = Person(name: "Tyrion", alias: "The imp", house: lannisterHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence(){
        
        XCTAssertNotNil(tyrion)
    }
    
    func testFullName(){
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
    }
    
    func testPersonEquality(){
        //Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        let imp = Person(name: "Tyrion", alias:"The imp", house: lannisterHouse)
        //Igualad
        XCTAssertEqual(tyrion, imp)
        
        //Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
    
    func testHasable(){
        XCTAssertNotNil(rob.hashValue)
        
    }
    
    func testComparale(){
        //Menor que
        XCTAssertTrue(arya < tyrion)
        
        // Mayor que
        XCTAssertTrue(tyrion > arya)
    }
    
}
