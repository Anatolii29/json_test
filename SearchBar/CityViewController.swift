//
//  CityViewController.swift
//  json_test
//
//  Created by Anatolii on 8/8/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cityArray: [City] = []
    var cityArrayFiltered: [City] = []
    var filtered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        let xib = UINib(nibName: "CityCollectViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "CityCollectViewCell")
        fillData()
    }
    
    func fillData() {
        
        let museum1 = Museum()
        museum1.name = "museum1"
        museum1.age = 12
        museum1.price = 50
        museum1.photo = "mus1"
        museum1.museumDescription = "dkdkdkdkdkdkdkdkdkdkdkdkkdkdkkdkdkdkdkkdrrtttttt"
        let museum2 = Museum()
        museum2.name = "museum2"
        museum2.age = 245
        museum2.price = 34263
        museum2.photo = "mus2"
        museum2.museumDescription = "ddddddd"
        let museumArray1 = [museum1,museum2]
        
        let city1 = City()
        city1.name = "Kiev"
        city1.photo = "kiev"
        city1.age =  1500
        city1.mer = "Klitchko"
        city1.population =  150000.00
        city1.square = 124.8
        city1.museumArray = museumArray1
        
        let city2 = City()
        city2.name = "Budapest"
        city2.photo = "bud"
        city2.age =  300
        city2.mer = "SADOVUY"
        city2.population =  1454542000.00
        city2.square = 100.8
        city2.museumArray = museumArray1
        
        cityArray.append(city1)
        cityArray.append(city2)
    }
    
}

extension CityViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtered ? cityArrayFiltered.count : cityArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectViewCell", for: indexPath) as! CityCollectViewCell
        item.update(city: filtered ? cityArrayFiltered[indexPath.row] : cityArray[indexPath.row])
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10 , height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CityPrifileViewController") as! CityPrifileViewController
        vc.update(city: filtered ? cityArrayFiltered[indexPath.row] : cityArray[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            filtered = true
            cityArrayFiltered = cityArray.filter({$0.name.lowercased().contains(searchText.lowercased())})
            collectionView.reloadData()
        }
        else {
            filtered = false
            collectionView.reloadData()
        }
    }
}
