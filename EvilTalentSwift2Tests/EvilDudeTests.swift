//
//  EvilDudeTests.swift
//  EvilTalentSwift2
//
//  Created by Jorge D. Ortiz Fuentes on 18/8/15.
//  Copyright © 2015 powwau. All rights reserved.
//

import XCTest
@testable import EvilTalentSwift2


class EvilDudeTests: XCTestCase {
    // MARK: - Constants & parameters
    static let mainName = "Juanita Banana"
    static let mainDestructivePower = 4
    static let mainMotivation = 2
    static let mainRating = 3
    
    
    // MARK: - Properties
    var sut: EvilDude!
    let jsonData = [ EvilDude.dictionaryKeyName: "Juanita Banana",
        EvilDude.dictionaryKeyDestructivePower: 4,
        EvilDude.dictionaryKeyMotivation: 2 ]
    

    // MARK: - Set Up & Tear
    
    override func setUp() {
        super.setUp()
        sut = EvilDude(dictionary: jsonData)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    // MARK: - Tests
    
    func testEvilDudeIsntInitialicedFromEmptyDict() {
        XCTAssertNil(EvilDude(dictionary: NSDictionary()), "No object must be returned from an empty dictionary")
    }
    
    
    func testEvilDudeIsInitialicedFromProperDict() {
        XCTAssertNotNil(sut, "An EvilDude object must be returned from a dictionary with proper data.")
    }
    
    
    func testEvilDudeNameAssignement() {
        XCTAssertEqual(sut.name, EvilDudeTests.mainName,
            "Name should be assigned to the value in the dictionary.")
    }
    
    
    func testEvilDudeDestructivePowerAssignement() {
        XCTAssertEqual(sut.destructivePower, EvilDudeTests.mainDestructivePower,
            "Destructive power should be assigned to the value in the dictionary.")
    }
    
    
    func testEvilDudeMotivationAssignement() {
        XCTAssertEqual(sut.motivation, EvilDudeTests.mainMotivation,
            "Motivation should be assigned to the value in the dictionary.")
    }
    
    
    func testEvilDudeRatingComputation() {
        XCTAssertEqual(sut.rating, EvilDudeTests.mainRating,
            "Rating should be computed with the destructive power and the motivation.")
    }
}
