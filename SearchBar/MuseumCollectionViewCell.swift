//
//  MuseumCollectionViewCell.swift
//  json_test
//
//  Created by Anatolii on 8/11/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class MuseumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var museumPhotoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(museum: Museum?) {
        museumPhotoImage.image = UIImage(named: museum?.photo ?? "")
    }
    
}
