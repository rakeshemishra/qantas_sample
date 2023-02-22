//
//  FakeAirportService.swift
//  QantasAirportTests
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import Foundation

@testable import QantasAirports

class FakeAirportService: OfflineService, AirportServiceProtocol {
    
    func getAirportList(callback: RequestCallback<AirportModel>?) {
        if let decodedResponse = decodedOfflineResponse(using: AirportModel.self) {
            callback?(.success(decodedResponse))
        } else {
            callback?(.error(.invalidResponse))
        }
    }
}
