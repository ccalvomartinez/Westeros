//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Administrador on 16/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation(){
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepoitoryHousesCreation(){
        let houses = Repository.local.housesFactory.elements
        
        XCTAssertNotNil(houses)
        XCTAssertGreaterThan(houses.count, 0)
    }
    
    func testLocalRepositoryHousesIsSortedArray() {
        let houses = Repository.local.housesFactory.elements
        
        // El tipo es un Array de House
        XCTAssertTrue(type(of: houses) == [House].self)
        
        // Está ordenado
        if houses.count >= 2 {
            for index in 1...(houses.count - 1)	{
                XCTAssertTrue(houses[index - 1] < houses[index])
            }
        }
        
        // Otra manera mejor de comprobar la ordenación
        XCTAssertEqual(houses, houses.sorted())
        
    }
    
    func testLocalRepositoryFuncHouseReturnsHouseOrNil(){
        let starkHouse = Repository.local.housesFactory.element(withName: "StaRk")
        
        XCTAssertNotNil(starkHouse)
        XCTAssertTrue(starkHouse?.name == "Stark")
        
        let notExistHouse = Repository.local.housesFactory.element(withName: "")
        XCTAssertNil(notExistHouse)
        
    }
    
    func testLocalRepositoryFilterHouses(){
        
        let housesStartWithT = Repository.local.housesFactory.filteredElements(filteredBy: {(house: House) -> Bool in return house.name.hasPrefix("T")})
        
        
        XCTAssertEqual(2, housesStartWithT.count)
        for house in housesStartWithT{
            XCTAssertTrue(house.name.hasPrefix("T"))
        }
        
        let housesWithMoreThan2People = Repository.local.housesFactory.filteredElements(filteredBy: {$0.count >= 2})
        
        XCTAssertEqual(3, housesWithMoreThan2People.count)
        for house in housesWithMoreThan2People{
            XCTAssertTrue(house.count >= 2)
        }
        
        let notResultFilterHouses = Repository.local.housesFactory.filteredElements(filteredBy: {$0.count < 0})
      
          XCTAssertEqual(0, notResultFilterHouses.count)
    }
    
}
