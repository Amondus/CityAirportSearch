//
//  AirportHttpService.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 17.10.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import Foundation
import Alamofire

class AirportHttpService: HttpService {
  
  var sessionManager: Session = Session.default
  
  func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
    return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
  }
}
