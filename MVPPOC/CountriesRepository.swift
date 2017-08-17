//
//  CountriesRepository.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/13/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation

class CountriesRepository: CountriesRepositoryProtocol {

    lazy var countries = [Country(name: "Colombia", date: Date()),
                     Country(name: "Brasil", date: Date().yesterday),
                     Country(name: "Perú", date: Date().tomorrow)]
    
    //MARK: CountriesRepositoryProtocol
    func getCountriesList(response: ([Country]) -> Void) {
        response(countries)
    }
}
