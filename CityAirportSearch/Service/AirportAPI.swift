//
//  AirportAPI.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 17.10.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import Foundation
import RxSwift

protocol AirportAPI {
  func fetchAirports() -> Single<AirportsResponse>
}
