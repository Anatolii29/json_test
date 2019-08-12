//
//  CityCollectionViewCell.swift
//  search_bar
//
//  Created by Anatolii on 8/5/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class CityCollectViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(city: City) {
        cityLabel.text = city.name
        cityImage.image = UIImage(named: city.photo)
    }
    
}
