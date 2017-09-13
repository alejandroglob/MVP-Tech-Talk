//
//  CountriesPresenter.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 9/13/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation

protocol CountriesPresenterProtocol {
    
    weak var view: CountriesViewProtocol? { get set }
    func fetchData()
    func countriesCount() -> Int
    func presenterCountry(at row: Int) -> PresenterCountry
}

protocol CountriesViewProtocol: class {
    func didFetchCountries()
}
