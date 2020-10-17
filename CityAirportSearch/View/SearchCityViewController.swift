//
//  SearchCityViewController.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 30.08.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class SearchCityViewController: UIViewController, Storyboardable {
  
  @IBOutlet weak var roundedView: UIView!
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var tableView: UITableView!
  
  private var viewModel: SearchCityViewPresentable!
  var viewModelBuilder: SearchCityViewPresentable.ViewModelBuilder!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.barStyle = .black
    title = "Airports"
    
    viewModel = viewModelBuilder((
      searchText: searchTextField.rx.text.orEmpty.asDriver(), ()
    ))
  }
}

