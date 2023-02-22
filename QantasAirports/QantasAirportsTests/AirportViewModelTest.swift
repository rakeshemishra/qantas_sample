//
//  AirportViewModelTest.swift
//  QantasAirportTests
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import XCTest

@testable import QantasAirports

final class AirportViewModelTest: XCTestCase {
    
    let airportRepo = AirportRepository(FakeAirportService())
    var viewModel: AirportViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let airportRepo = AirportRepository(FakeAirportService())
        viewModel = AirportViewModel(airportRepository: airportRepo)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchAirportData() {
        let exp = expectation(description: "\(#function)")

        viewModel?.fetchAirportData(completion: { completion in
            XCTAssertTrue(completion)
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 40, handler: nil)
    }
    
    func testFetchOfflineAirportData() {
        let exp = expectation(description: "\(#function)")
        
        viewModel?.fetchOfflineAirportData(completion: { completion in
            XCTAssertTrue(completion)
            exp.fulfill()
        })

        waitForExpectations(timeout: 40, handler: nil)
    }
    
    func testUpdateModel() {
        let model = viewModel?.updateModel()
        XCTAssertNil(model)
    }
    
    func testNumberOfRows() {
        let rows = viewModel?.numberOfRows()
        XCTAssertEqual(rows ?? 0, 0);
    }
}
