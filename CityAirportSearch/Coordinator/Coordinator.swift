//
//  Coordinator.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 30.08.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import Foundation

protocol Coordinator: class {
  
  var childCoordinator: [Coordinator] { get set }
  
  func start()
}

extension Coordinator {
  func add(coordinator: Coordinator) {
    childCoordinator.append(coordinator)
  }
  
  func remove(coordinator: Coordinator) {
    childCoordinator = childCoordinator.filter { $0 !== coordinator }
  }
}
