//
//  AirportRepositoryTest.swift
//  QantasAirportTests
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import XCTest

@testable import QantasAirports

final class AirportRepositoryTest: XCTestCase {
    let airportRepo = AirportRepository(FakeAirportService())

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchAirports() {
        let exp = expectation(description: "\(#function)")
        
        airportRepo.fetchAirports { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .error(let error):
                XCTAssertNotNil(error)
            }
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 40, handler: nil)
    }
    
    func testFetchOfflineAirportList() {
        let exp = expectation(description: "\(#function)")
        
        airportRepo.fetchOfflineAirportList { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .error(let error):
                XCTAssertNotNil(error)
            }
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 40, handler: nil)
    }

}
