//
//  AirportModel.swift
//  QantasAirport
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import Foundation

typealias AirportModel = [AirportModelElement]

// MARK: - AirportModelElement
struct AirportModelElement: Codable {
    let airportCode: String
    let internationalAirport, domesticAirport, regionalAirport, onlineIndicator: Bool
    let eticketableAirport: Bool
    let location: Location
    let airportName: String
    let city: City
    let state: State
    let country: Country
    let region: Region
    let preferredInternationalAirportCode: String?
}

// MARK: - City
struct City: Codable {
    let cityCode: String
    let cityName: String?
    let timeZoneName: String
}

// MARK: - Country
struct Country: Codable {
    let countryCode, countryName: String
}

// MARK: - Location
struct Location: Codable {
    let aboveSeaLevel: Int?
    let latitude, latitudeRadius, longitude, longitudeRadius: Double
    let latitudeDirection: LatitudeDirection?
    let longitudeDirection: LongitudeDirection?
}

enum LatitudeDirection: String, Codable {
    case n = "N"
    case s = "S"
}

enum LongitudeDirection: String, Codable {
    case e = "E"
    case n = "N"
    case w = "W"
}

// MARK: - Region
struct Region: Codable {
    let regionCode: RegionCode
    let regionName: RegionName
}

enum RegionCode: String, Codable {
    case af = "AF"
    case am = "AM"
    case au = "AU"
    case eu = "EU"
    case me = "ME"
    case regionCodeAS = "AS"
    case sp = "SP"
}

enum RegionName: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case asia = "Asia"
    case australia = "Australia"
    case europe = "Europe"
    case middleEast = "Middle East"
    case southPacific = "South Pacific"
}

// MARK: - State
struct State: Codable {
    let stateCode: StateCode?
    let stateName: StateName?
}

enum StateCode: String, Codable {
    case act = "ACT"
    case nsw = "NSW"
    case nt = "NT"
    case qld = "QLD"
    case sa = "SA"
    case tas = "TAS"
    case vic = "VIC"
    case wa = "WA"
}

enum StateName: String, Codable {
    case australianCapitalTerritory = "Australian Capital Territory"
    case newSouthWales = "New South Wales"
    case northernTerritory = "Northern Territory"
    case queensland = "Queensland"
    case southAustralia = "South Australia"
    case tasmania = "Tasmania"
    case victoria = "Victoria"
    case westernAustralia = "Western Australia"
}
