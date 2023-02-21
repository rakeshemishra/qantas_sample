//
//  AirportService.swift
//  QantasAirport
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import Foundation

protocol AirportServiceProtocol {
    func getAirportList(callback: RequestCallback<AirportModel>?)
}

class AirportService: AirportServiceProtocol {
    
    func getAirportList(callback: RequestCallback<AirportModel>?) {
        APIManager.shared.callRequest(path: "airport") { result in
            switch result {
            case .success(let jsonResponse):
                do {
                    let decodedResponse = try JSONDecoder().decode(AirportModel.self, from: jsonResponse)
                    callback?(.success(decodedResponse))
                } catch let error {
                    callback?(.error(.error))
                    debugPrint(error.localizedDescription)
                }
            case .error:
                callback?(.error(.error))
            }
        }
    }
}
