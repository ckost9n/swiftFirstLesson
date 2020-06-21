//
//  AllCitiesTableViewController.swift
//  Weather
//
//  Created by Konstantin on 21.06.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import UIKit

class AllCitiesTableViewController: UITableViewController {
    
    let cities: [String] = [
        "Moscow",
        "London",
        "New-York"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AllCitiesCell
        
        cell.cityLabel.text = cities[indexPath.row]
        
        return cell
    }
    

}
