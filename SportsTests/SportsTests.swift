//
//  SportsTests.swift
//  SportsTests
//
//  Created by Macos on 10/05/2025.
//

import XCTest
@testable import Sports

final class SportsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testFetchSports() {
        let expectation = self.expectation(description: "FetchSports")

        NetworkService.fetchSports(sportType: "football") { response in
            XCTAssertNotNil(response, "Expected non-nil response for fetchSports")
            XCTAssertGreaterThan(response?.result.count ?? 0, 0, "Expected at least one league")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 10, handler: nil)
    }
    func testFetchPlayers() {
        let expectation = self.expectation(description: "FetchPlayers")

        NetworkService.fetchPlayers(sportType: "football", teamName: "Barcelona") { response in
            XCTAssertNotNil(response, "Expected non-nil response for fetchPlayers")
            XCTAssertGreaterThan(response?.result.count ?? 0, 0, "Expected at least one player")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 10, handler: nil)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
