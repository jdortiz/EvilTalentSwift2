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
    
    // MARK: - Set Up & Tear
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: - Tests
    
    func testEvilDudeIsntInitialicedFromEmptyDict() {
        XCTAssertNil(EvilDude(dictionary: NSDictionary()), "No object must be returned from an empty dictionary")
    }
}
