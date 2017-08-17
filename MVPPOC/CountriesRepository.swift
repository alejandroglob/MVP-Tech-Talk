//
//  CountriesRepository.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/13/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation

class CountriesRepository: CountriesRepositoryProtocol {
    
    lazy var countriesArray: [Country] = {
        
        let locale = NSLocale.current as NSLocale
        let countryArray = NSLocale.isoCountryCodes
        var unsortedCountryArray = [Country]()
        
        for countryCode in countryArray {
            let displayNameString = locale.displayName(forKey: NSLocale.Key.countryCode, value: countryCode)
            if let displayNameString = displayNameString {
                unsortedCountryArray.append(Country(name: displayNameString))
            }
        }
        return unsortedCountryArray.sorted(by: { (name1, name2) -> Bool in
            return name1 < name2
        })
        
    }()
    
    //MARK: CountriesRepositoryProtocol
    func getCountriesList(response: ([Country]) -> Void) {
        response(countriesArray)
    }
}
