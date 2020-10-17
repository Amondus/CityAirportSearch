//
//  AppCoordinator.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 30.08.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
  
  private let window: UIWindow
  private let navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    let navigationBar = navigationController.navigationBar
    
    navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationBar.shadowImage = UIImage()
    navigationBar.barTintColor = UIColor(red: 233.0/255.0,
                                         green: 55.0/255.0,
                                         blue: 72.0/255.0,
                                         alpha: 1.0)
    navigationBar.tintColor = .white
    navigationBar.titleTextAttributes = [.font: UIFont(name: "Avenir-Medium", size: 28)!,
                                         .foregroundColor: UIColor.white]
    navigationBar.isTranslucent = false
    
    return navigationController
  }()
  
  init(window: UIWindow) {
    self.window = window
  }
  
  override func start() {
    let searchCityCoordinator = SearchCityCoordinator(navigationController: navigationController)
    
    self.add(coordinator: searchCityCoordinator)
    searchCityCoordinator.start()
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
}
