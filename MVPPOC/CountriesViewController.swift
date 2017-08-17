//
//  CountriesViewController.swift
//  MVPPOC
//
//  Created by Alejandro Rodriguez on 8/13/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CountriesPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.fetchCountries()
    }
}

extension CountriesViewController: CountriesViewProtocol{
    
    func didFetchCountries() {
        tableView.reloadData()
    }
}

extension CountriesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.countriesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        }

        let countryName = presenter?.country(at: indexPath).0 ?? ""
        let date = presenter?.country(at: indexPath).1 ?? ""
        cell?.textLabel?.text = countryName
        cell?.detailTextLabel?.text = date
        
        return cell!
    }
}
