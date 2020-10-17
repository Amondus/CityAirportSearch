//
//  BaseCoordinator.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 30.08.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
  var childCoordinator: [Coordinator] = []
  
  func start() {
    fatalError("Children should implement 'start'")
  }
}
