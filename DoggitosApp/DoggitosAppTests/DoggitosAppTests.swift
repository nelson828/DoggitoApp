//
//  DoggitosAppTests.swift
//  DoggitosAppTests
//
//  Created by Nelson Ramirez on 2/27/18.
//  Copyright © 2018 Nelson Ramirez. All rights reserved.
//

import XCTest
@testable import DoggitosApp

class DoggitosAppTests: XCTestCase {
    
    var breedViewModel : BreedViewModel? = BreedViewModel()
    
    var imagesBreedViewModel : ImagesBreedViewModel? = ImagesBreedViewModel()
    
    override func setUp() {
        super.setUp()
        
        breedViewModel?.breed = Breed(status: "success", message: ["dog1","dog2"])
        
        imagesBreedViewModel?.dogs = Dogs(status: "success", message: ["https://dog.ceo/api/img/kelpie/n02105412_1031.jpg","https://dog.ceo/api/img/kelpie/n02105412_1106.jpg"])
        
    }
    
    override func tearDown() {
        
        self.breedViewModel = nil
        self.imagesBreedViewModel = nil
        
        super.tearDown()
    }
    
    func testCountBreed(){
        XCTAssertEqual(breedViewModel?.getCountBreeds(), 2)
    }
    
    func testCountUrlDogs(){
        XCTAssertEqual(imagesBreedViewModel?.getCountImages(), 2)
    }
    
    func testResultFetchBreed(){
        let expect = expectation(description: "Fetch Data Breed!")
        
        breedViewModel?.fetchBreedList {
            XCTAssertNotNil(self.breedViewModel?.breed?.message)
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Test time out. \(String(describing: error?.localizedDescription))")
        }
    }
    
    func testResultFetchDogs(){
        let expect = expectation(description: "Fetch Data Dogs!")
        
        imagesBreedViewModel?.breedName = "african"
        
        imagesBreedViewModel?.fetchUrlImagesList {
            XCTAssertNotNil(self.imagesBreedViewModel?.dogs?.message)
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Test time out. \(String(describing: error?.localizedDescription))")
        }
    }
    
    func testMessageBreed(){
        let breed = Breed(status: "success", message: ["bulldog", "boxer"])
        XCTAssertEqual(breed.message!, ["bulldog", "boxer"])
    }
    
    func testUrlDogs(){
        let dog = Dogs(status: "success", message: ["https://dog.ceo/api/img/kelpie/n02105412_1031.jpg"])
        XCTAssertEqual(dog.message!, ["https://dog.ceo/api/img/kelpie/n02105412_1031.jpg"])
    }
    
    //TODO: Make more Test! :D
}
