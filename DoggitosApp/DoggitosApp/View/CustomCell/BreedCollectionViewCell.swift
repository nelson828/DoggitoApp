//
//  BreedCollectionViewCell.swift
//  DoggitosApp
//
//  Created by Nelson Ramirez on 2/26/18.
//  Copyright © 2018 Nelson Ramirez. All rights reserved.
//

import UIKit

class BreedCollectionViewCell: UICollectionViewCell {

    @IBOutlet var viewContainerPicture: UIView!
    @IBOutlet var breedLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    func configure(breedName : String) {
        
        self.breedLabel.text = breedName
        
        viewContainerPicture.clipsToBounds = false
        viewContainerPicture.layer.shadowColor = UIColor.black.cgColor
        viewContainerPicture.layer.shadowOpacity = 1
        viewContainerPicture.layer.shadowOffset = CGSize.zero
        viewContainerPicture.layer.shadowRadius = 2

        viewContainerPicture.layer.cornerRadius = viewContainerPicture.frame.size.height/2

        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.size.height/2

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
