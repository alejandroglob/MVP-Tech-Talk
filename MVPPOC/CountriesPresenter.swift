//
//  CountriesPresenter.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/13/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation


class CountriesPresenter: CountriesPresenterProtocol {
    
    weak var view: CountriesViewProtocol?
    var repository: CountriesRepositoryProtocol
    var countries = Array<Country>()
    
    init(repository: CountriesRepositoryProtocol) {
        self.repository = repository
    }
    
    //MARK: CountriesPresenterProtocol
    func fetchCountries() {
        repository.getCountriesList(response: {[weak self] countries in
            guard let unwrappedSelf = self else { return }
            unwrappedSelf.countries = countries
            unwrappedSelf.view?.didFetchCountries()
        })
    }
    
    func countriesCount() -> Int{
        return countries.count
    }
    
    func country(at indexPath: IndexPath) -> (String, String){
        let country = countries[indexPath.row]
        return (country.name, convert(date: country.date))
    }

    //MARK: Aux methods
    func convert(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from:date)
    }
}
