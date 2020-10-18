//
//  AirportModel.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 17.10.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import Foundation

struct AirportModel: Codable {
  let code: String
  let lat: String
  let lon: String
  let name: String
  let city: String
  let country: String
  let woeid: String
  let tz: String
  let phone: String
  let type: String
  let email: String
  let url: String
  let icao: String
  let elev: String?
  let runwayLength: String?
  let state: String?
  let directFlights: String
  let carriers: String
  
  enum CodingKeys: String, CodingKey {
    case code
    case lat
    case lon
    case name
    case city
    case country
    case woeid
    case tz
    case phone
    case type
    case email
    case url
    case icao
    case elev
    case runwayLength = "runway_length"
    case state
    case directFlights = "direct_flights"
    case carriers
  }
}

extension AirportModel: Equatable {
  static func == (lhs: AirportModel, rhs: AirportModel) -> Bool {
    return lhs.code == rhs.code
  }
}

extension AirportModel: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(code)
  }
}

typealias AirportsResponse = [AirportModel]
