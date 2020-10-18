//
//  SearchCityViewModel.swift
//  CityAirportSearch
//
//  Created by Антон Захарченко on 30.08.2020.
//  Copyright © 2020 Anton Zakharchenko. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SearchCityViewPresentable {
  
  typealias Input = (searchText: Driver<String>, ())
  typealias Output = ()
  typealias ViewModelBuilder = (SearchCityViewPresentable.Input) -> SearchCityViewPresentable
  
  var input: SearchCityViewPresentable.Input { get }
  var output: SearchCityViewPresentable.Output { get }
}

class SearchCityViewModel: SearchCityViewPresentable {
  
  var input: SearchCityViewPresentable.Input
  var output: SearchCityViewPresentable.Output
  
  private let airportService: AirportAPI
  private let disposeBag = DisposeBag()
  
  typealias State = (airports: BehaviorRelay<Set<AirportModel>>, ())
  private let state: State = (airports: BehaviorRelay(value: []), ())
  
  init(input: SearchCityViewPresentable.Input,
       airportService: AirportAPI) {
    self.input = input
    self.output = SearchCityViewModel.output(input: self.input,
                                             state: state,
                                             disposeBag: disposeBag)
    self.airportService = airportService
    self.process()
  }
}

private extension SearchCityViewModel {
  static func output(input: SearchCityViewPresentable.Input,
                     state: State,
                     disposeBag: DisposeBag) -> SearchCityViewPresentable.Output {
    
    let searchTextObservable = input.searchText
      .debounce(.milliseconds(300))
      .distinctUntilChanged()
      .skip(1)
      .asObservable()
      .share(replay: 1, scope: .whileConnected)
    
    let airportsObservable = state.airports
      .skip(1)
      .asObservable()
    
    Observable
      .combineLatest(searchTextObservable, airportsObservable)
      .map { searchKey, airports in
        return airports.filter { airport -> Bool in
          !searchKey.isEmpty &&
            airport.city
            .lowercased()
            .replacingOccurrences(of: " ", with: "")
            .hasPrefix(searchKey.lowercased())
        }
      }
      .map {
        print($0)
      }
      .subscribe()
      .disposed(by: disposeBag)
    
    return ()
  }
  
  func process() {
    self.airportService
      .fetchAirports()
      .map { Set($0)}
      .map { [state] in
        state.airports.accept($0)
      }
      .subscribe()
      .disposed(by: disposeBag)
  }
}
