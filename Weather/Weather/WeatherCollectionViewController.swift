//
//  WeatherCollectionViewController.swift
//  Weather
//
//  Created by Konstantin on 21.06.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import UIKit


class WeatherCollectionViewController: UICollectionViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WeatherCell
    
        
    
        return cell
    }

}
