//
//  SearchCityCoordinator.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 30.08.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import UIKit

class SearchCityCoordinator: BaseCoordinator {
  
  private let navigationController: UINavigationController?
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  override func start() {
    let view = SearchCityViewController.instantiate()
    
    let service = AirportService.shared
    
    view.viewModelBuilder = {
      SearchCityViewModel(input: $0, airportService: service)
    }
    
    navigationController?.pushViewController(view, animated: true)
  }
}
