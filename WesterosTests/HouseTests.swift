//
//  HouseTe/Users/administrador/Downloads/lannister.jpgsts.swift
//  Westeros
//
//  Created by Administrador on 6/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
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
    
    func testHouseExistence(){
      
        XCTAssertNotNil(starkHouse)
        
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Stark_escudo.png"), description: "Direwolf")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Lannister_escudo.png"), description: "Rampant Lion")
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPeson() {
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.add(person: rob)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
        
    }
    func testSortedPerson(){
        let persons = starkHouse.sortedMembers()
        // El tipo es un Array de House
        XCTAssertTrue(type(of: persons) == [Person].self)
        
       
        // Comprobar la ordenación
        XCTAssertEqual(persons, persons.sorted())

    }
    func testHouseEquality(){
        //Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        //Igualdad
        let jinxed = House(name: "Stark", sigil:starkSigil, words: "Winter is coming", url: URL(string: "https://google.es")!)
        XCTAssertEqual(starkHouse, jinxed)
        
        //Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHasable(){
        XCTAssertNotNil(starkHouse.hashValue)
    
    }
    
    func testHouseCompare(){
        
        //Menor que
        XCTAssertTrue(lannisterHouse < starkHouse)
        
        // Mayor que
        XCTAssertTrue(starkHouse > lannisterHouse)
    }
    
}
