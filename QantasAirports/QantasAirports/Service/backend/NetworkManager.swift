//
//  NetworkManager.swift
//  QantasAirport
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    let baseUrl = " https://api.qantas.com/flight/refData/"
    
    func callRequest(path: String, callback: RequestCallback<Data>?) {
        
        let requestUrl = URL(string: "https://api.qantas.com/flight/refData/airport")!
       
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.requestCachePolicy = .useProtocolCachePolicy
        let cache = URLCache.shared
        sessionConfig.urlCache = cache
        
        var request = URLRequest(url: requestUrl)
        request.cachePolicy = .returnCacheDataElseLoad
        
        let session = URLSession(configuration: sessionConfig)
        
        session.dataTask(with: request) { responseData, urlResponse, error in
            DispatchQueue.main.async {
                if let data = responseData, let response = urlResponse {
                    let cachedResponse = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedResponse, for: request)
                    callback?(.success(data))
                } else {
                    callback?(.error(.error))
                }
            }
            
        }.resume()
    }
}
