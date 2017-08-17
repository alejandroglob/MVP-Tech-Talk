//
//  Country.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/13/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation

struct Country{
    let name: String
}

extension Country: Comparable, Equatable{
    static func < (lhs: Country, rhs: Country) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.name == rhs.name
    }
}
