//
//  CountriesPresenter.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/13/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation


class CountriesPresenter: CountriesPresenterProtocol {
    
    var view: CountriesViewProtocol?
    var repository: CountriesRepositoryProtocol?
    var countries = [Country]()
    
    required init(repository: CountriesRepositoryProtocol?) {
        self.repository = repository
    }
    
    func setView(view: CountriesViewProtocol){
        self.view = view
    }
    
    //MARK: CountriesPresenterProtocol
    func fetchCountries() {
        repository?.getCountriesList(response: {[unowned self] countries in
            self.countries = countries
            self.view?.didFetchCountries()
        })
    }
    
    func countriesCount() -> Int{
        return countries.count
    }
    
    func country(at indexPath: IndexPath) -> Country?{
        return countries[indexPath.row]
    }
}
