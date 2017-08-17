//
//  Date.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/17/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation

extension Date {
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
}
