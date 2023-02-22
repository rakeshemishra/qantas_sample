//
//  AirportViewModel.swift
//  QantasAirport
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import Foundation

class AirportViewModel {

    private var airportModel: AirportModel?
    private let airportRepository: AirportDataSource
    
    var numberOfRows: Int {
        return airportModel?.count ?? 0
    }

    init(airportRepository: AirportRepository) {
        self.airportRepository = airportRepository
    }
    
    func fetchAirportData(completion: @escaping (Bool) -> Void) {
        airportRepository.fetchAirports { [weak self] result in
            switch result {
            case .success(let model):
                self?.airportModel = model
                completion(true)
            case .error(let error):
                completion(false)
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func fetchOfflineAirportData(completion: @escaping (Bool) -> Void) {
        airportRepository.fetchOfflineAirportList { [weak self] result in
            switch result {
            case .success(let model):
                self?.airportModel = model
                completion(true)
            case .error(let error):
                completion(false)
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func airPortDetailsForRow(indexPath: Int) -> AirportModelElement? {
        return airportModel?[indexPath]
    }
}
