//
//  MuseumViewController.swift
//  json_test
//
//  Created by Anatolii on 8/11/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class MuseumViewController: UIViewController {
    
    @IBOutlet weak var museumPhotoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var currentMuseum: Museum?

    override func viewDidLoad() {
        super.viewDidLoad()

       fillData()
    }
    

    func update(museum: Museum?) {
        currentMuseum = museum
    }
    
    func fillData() {
        museumPhotoImage.image = UIImage(named: currentMuseum?.photo ?? "")
        nameLabel.text = currentMuseum?.name
        ageLabel.text = String(Int(currentMuseum?.age ?? 0))
        ageLabel.text = String(Int(currentMuseum?.age ?? 0))
        priceLabel.text = String(Int(currentMuseum?.price ?? 0))
        descriptionLabel.text = currentMuseum?.museumDescription
    }
}
