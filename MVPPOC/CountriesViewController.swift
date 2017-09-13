//
//  CountriesMVPViewController.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/24/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {

    let cellIdentifier = "Cell"
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }

    //MARK: Aux Methods
    func convert(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from:date)
    }
 
    func loadData() {

        countries = [Country(name: "Colombia", date: Date()),
                     Country(name: "Brasil", date: Date().yesterday),
                     Country(name: "Perú", date: Date().tomorrow),
                     Country(name: "Argentina", date: Date()),
                     Country(name: "Uruguay", date: Date().tomorrow),
                     Country(name: "Paraguay", date: Date().tomorrow),
                     Country(name: "Bolivia", date: Date().tomorrow),
                     Country(name: "Chile", date: Date().tomorrow),
                     Country(name: "Venezuela", date: Date().tomorrow)]
    }

}


extension CountriesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            fatalError("Should've dequeued cell with that identifier")
        }
        
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = convert(date: country.date)
        
        return cell
    }
}
