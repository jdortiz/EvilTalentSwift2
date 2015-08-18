//
//  EvilTalentAPIClient.swift
//  EvilTalentSwift2
//
//  Created by Jorge D. Ortiz Fuentes on 18/8/15.
//  Copyright © 2015 powwau. All rights reserved.
//


import XCTest
@testable import EvilTalentSwift2


class EvilTalentAPIClientTests: XCTestCase {
    var sut: EvilTalentAPIClient!
    var completionInvoked = false
    

    // MARK: - Set Up & Tear
    
    override func setUp() {
        super.setUp()
        sut = EvilTalentAPIClient()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    // MARK: - Tests
    
    func testParseServerDataDoesntCallCompletionWithBrokenJSON() {
        let brokenJsonData = "{".dataUsingEncoding(NSUTF8StringEncoding)
        sut.completion = fakeCompletion
        
        sut.parseServerData(brokenJsonData, response: nil, error: nil)
        
        XCTAssertFalse(completionInvoked, "Completion closure must not be called with broken JSON data.")
    }
    
    
    func testParseServerDataCallsCompletionWithProperJSON() {
        let goodJsonData = "[ {\"name\": \"Juanita Banana\"} ]".dataUsingEncoding(NSUTF8StringEncoding)
        sut.completion = fakeCompletion
        
        sut.parseServerData(goodJsonData, response: nil, error: nil)
        
        XCTAssertTrue(completionInvoked, "Completion closure must not be called with proper JSON data.")
    }
    
    
    func testParseServerDataExitsIfCalledWithError() {
        let error = NSError(domain: "Test", code: 0, userInfo: nil)
        let brokenJsonData = "{".dataUsingEncoding(NSUTF8StringEncoding)
        let mockedSut = MockEvilTalentAPIClient()
        
        mockedSut.parseServerData(brokenJsonData, response: nil, error: error)
        
        XCTAssertFalse(mockedSut.parseJSONDataInvoked, "JSON parser shouldn't be invoked if method is invoked with error.")
    }
    
    
    func testParseServerDataExitsIfCalledWithoutData() {
        let mockedSut = MockEvilTalentAPIClient()
        
        mockedSut.parseServerData(nil, response: nil, error: nil)
        
        XCTAssertFalse(mockedSut.parseJSONDataInvoked, "JSON parser shouldn't be invoked if method is invoked with error.")
    }


    // MARK: - Auxiliary methods
    
    func fakeCompletion(jsonData: [NSDictionary]) -> Void {
        completionInvoked = true
    }
}


// MARK: - Mock class

class MockEvilTalentAPIClient: EvilTalentAPIClient {
    var parseJSONDataInvoked = false
    
    override func parseJSONData(data: NSData, options opt: NSJSONReadingOptions) throws -> AnyObject {
        parseJSONDataInvoked = true
        return []
    }
}
