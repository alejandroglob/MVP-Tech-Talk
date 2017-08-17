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


protocol CountriesViewProtocol {
    
    func didFetchCountries()
}

protocol CountriesPresenterProtocol {
    
    func setView(view: CountriesViewProtocol)
    func fetchCountries()
    func country(at indexPath: IndexPath) -> Country?
    func countriesCount() -> Int
}
