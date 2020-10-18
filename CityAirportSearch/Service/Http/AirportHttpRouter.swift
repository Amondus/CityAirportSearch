//
//  AirportHttpRouter.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 17.10.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import Foundation
import Alamofire

enum AirportHttpRouter {
  case getAirports
}

extension AirportHttpRouter: HttpRouter {
  
  var baseUrlString: String {
    return "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588"
  }
  
  var path: String {
    switch self {
    case .getAirports:
      return "airports.json"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .getAirports:
      return .get
    }
  }
}
