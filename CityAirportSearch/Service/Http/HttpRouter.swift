//
//  HttpRouter.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 17.10.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import Foundation
import Alamofire

protocol HttpRouter {
  var baseUrlString: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var headers: HTTPHeaders? { get }
  var parameters: Parameters? { get }
  
  func body() throws -> Data?
  func request(usingHttpService service: HttpService) throws -> DataRequest
}

extension HttpRouter {
  
  var parameters: Parameters? { return nil }
  var headers: HTTPHeaders? { return nil }
  
  func body() throws -> Data? { return nil }
  
  func asUrlRequest() throws -> URLRequest {
    var url = try baseUrlString.asURL()
    url.appendPathComponent(path)
    
    var request = try URLRequest(url: url, method: method, headers: headers)
    request.httpBody = try body()
    
    return request
  }
  
  func request(usingHttpService service: HttpService) throws -> DataRequest {
    return try service.request(asUrlRequest())
  }
}