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
    func testFetchPlayersFailure() {
        let expectation = self.expectation(description: "FetchPlayersFailure")

        NetworkService.fetchPlayers(sportType: "football", teamName: "InvalidTeamNameXYZ") { response in
            XCTAssertNil(response, "Expected nil response for invalid team name")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 10, handler: nil)
    }
    func testFetchSportsFailure() {
        let expectation = self.expectation(description: "FetchSportsFailure")

        NetworkService.fetchSports(sportType: "InvalidSport") { response in
            XCTAssertNil(response, "Expected nil response for fetchSports")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    func testFetchLeaguesDetails() {
            let expectation = self.expectation(description: "FetchLeaguesDetails")

            let sportType = "football"
            let leagueId = "207"
            NetworkService.fetchLeaguesDetails(sportType: sportType, leaguesKey: leagueId) { response in
                XCTAssertNotNil(response, "Expected non-nil response for fetchLeaguesDetails")
                
                if let decoded = response as? LeaguesDetailsResponse {
                    XCTAssertGreaterThan(decoded.result?.count ?? 0, 0, "Expected at least one fixture")
                } else {
                    XCTFail("Response is not of type LeaguesDetailsResponse")
                }

                expectation.fulfill()
            }

            waitForExpectations(timeout: 10, handler: nil)
        }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
