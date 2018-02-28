//
//  PictureCollectionViewCell.swift
//  DoggitosApp
//
//  Created by Nelson Ramirez on 2/27/18.
//  Copyright © 2018 Nelson Ramirez. All rights reserved.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
//    var customImageView = CustomImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(urlString : String){
        
        imageView.loadImageFromUrl(urlString: urlString)
        
        //TODO: Make the images do not reload
//        customImageView.loadImageFromUrl(urlString: urlString)
//        imageView.image = customImageView.image
        
    }

}
