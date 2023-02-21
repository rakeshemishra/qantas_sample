//
//  RequestCallback.swift
//  QantasAirport
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(ErrorType)
}

enum ErrorType: Error {
    case error
    case invalidResponse
}

typealias RequestCallback<T> = (Result<T>) -> Void
