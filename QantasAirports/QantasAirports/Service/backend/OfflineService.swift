//
//  OfflineService.swift
//  QantasAirport
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import Foundation

class OfflineService {
    
    internal func offlineData<T: Decodable>(using decodingType: T.Type) -> Data? {
        let fileName = String(describing: decodingType)
        if let path = Bundle.main.path(forResource: "AirportData", ofType: "json") {
            return try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        }
        
        return nil
    }
    
    internal func decodedOfflineResponse<T: Decodable>(using decodingType: T.Type, filenameSuffix: String? = nil) -> T? {
        if let data = offlineData(using: decodingType) {
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                return try jsonDecoder.decode(decodingType, from: data)
            } catch {
                print("Error during \(self) decodedOfflineResponse(using: \(decodingType): \(error)")
                return nil
            }
        }
        
        return nil
    }
    
    func decodeResponse<T: Decodable>(from data: Data, using decodingType: T.Type) -> T? {
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            return try jsonDecoder.decode(decodingType, from: data)
        } catch {
            print("Error during \(self) decodeResponse(using: \(decodingType): \(error)")
            return nil
        }
    }
    
    func decodeResponseWithErrorType<T: Decodable>(from data: Data, using decodingType: T.Type) -> (response: T?, error: Error?) {
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            return (try jsonDecoder.decode(decodingType, from: data), nil)
        } catch {
            print("Error during \(self) decodeResponsePlusError(using: \(decodingType): \(error)")
            return (nil, error)
        }
    }
}
