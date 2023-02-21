//
//  AirportRepository.swift
//  QantasAirport
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import Foundation

protocol AirportDataSource {
    func fetchAirports(callback: RequestCallback<AirportModel>?)
    func fetchOfflineAirportList(callback: RequestCallback<AirportModel>?)
}

class AirportRepository: OfflineService, AirportDataSource {
    private let service: AirportServiceProtocol

    init(_ service: AirportServiceProtocol) {
        self.service = service
    }
    
    func fetchAirports(callback: RequestCallback<AirportModel>?) {
        service.getAirportList { result in
            switch result {
            case .success(let response):
                callback?(.success(response))
            case .error:
                callback?(.error(.error))
            }
        }
    }
    
    func fetchOfflineAirportList(callback: RequestCallback<AirportModel>?) {
        if let decodedResponse = decodedOfflineResponse(using: AirportModel.self) {
            callback?(.success(decodedResponse))
        } else {
            callback?(.error(.invalidResponse))
        }
    }
}
