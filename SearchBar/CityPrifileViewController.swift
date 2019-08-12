//
//  CityPrifileViewController.swift
//  json_test
//
//  Created by Anatolii on 8/11/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class CityPrifileViewController: UIViewController {
    
    @IBOutlet weak var cityPhotoImage: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var merLabel: UILabel!
    @IBOutlet weak var squareLabel: UILabel!
    @IBOutlet weak var museumsCollectionView: UICollectionView!
    
    var currentCity: City?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        museumsCollectionView.delegate = self
        museumsCollectionView.dataSource = self
        let xib = UINib(nibName: "MuseumCollectionViewCell", bundle: nil)
        museumsCollectionView.register(xib, forCellWithReuseIdentifier: "MuseumCollectionViewCell")
        fillData()
        
    }
    
    func update(city: City) {
        currentCity = city
    }
    
    func fillData() {
        cityPhotoImage.image = UIImage(named: currentCity?.photo ?? "")
        cityNameLabel.text = currentCity?.name
        populationLabel.text = String(Int(currentCity?.population ?? 0))
        ageLabel.text = String(Int(currentCity?.age ?? 0))
        merLabel.text = currentCity?.mer
        squareLabel.text = String(Int(currentCity?.square ?? 0))
    }

}

extension CityPrifileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentCity?.museumArray.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = museumsCollectionView.dequeueReusableCell(withReuseIdentifier: "MuseumCollectionViewCell", for: indexPath) as! MuseumCollectionViewCell
        item.update(museum: currentCity?.museumArray[indexPath.row])
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: museumsCollectionView.frame.width / 2 - 10 , height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MuseumViewController") as! MuseumViewController
        vc.update(museum:  currentCity?.museumArray[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

