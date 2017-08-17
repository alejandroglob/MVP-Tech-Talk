//
//  injections.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/13/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    class func setup() {
        
        defaultContainer.storyboardInitCompleted(UINavigationController.self) { r, c in }
        
        defaultContainer.register(CountriesRepositoryProtocol.self) { r in
            CountriesRepository()
        }
        
        defaultContainer.register(CountriesPresenterProtocol.self) { r in
            CountriesPresenter(repository: r.resolve(CountriesRepositoryProtocol.self))
        }
        
        defaultContainer.storyboardInitCompleted(CountriesViewController.self) { r, c in
            c.presenter = r.resolve(CountriesPresenterProtocol.self)
            c.presenter?.setView(view: c)
        }
    }
    
}
