//
//  CountriesContract.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/13/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation

protocol CountriesRepositoryProtocol {
    
    func getCountriesList(response: ([Country]) -> Void)
}

protocol CountriesViewProtocol: class {
    
    func didFetchCountries()
}

protocol CountriesPresenterProtocol: class {
    weak var view: CountriesViewProtocol? { get set}
    func fetchCountries()
    func country(at indexPath: IndexPath) -> (String, String)
    func countriesCount() -> Int
}
