//
//  HttpService.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 17.10.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import Foundation
import Alamofire

protocol HttpService {
  var sessionManager: Session { get set }
  
  func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
