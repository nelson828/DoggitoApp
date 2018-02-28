//
//  ManyPuppiesVC.swift
//  DoggitosApp
//
//  Created by Nelson Ramirez on 2/27/18.
//  Copyright © 2018 Nelson Ramirez. All rights reserved.
//

import UIKit

class ManyPuppiesVC: UIViewController {

    @IBOutlet var containerViewPicture: UIView!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var imageViewBackgroundHeader: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var viewHeader: UIView!
    
    @IBOutlet var breedNameLabel: UILabel!
    var breedName = ""
    
    private var viewModel = ImagesBreedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        breedNameLabel.text = breedName
        
        self.viewModel.breedName = breedName
        
        configView()
        
        fetchData()
    }
    
    func configView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "PictureCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "customCell")
        
        containerViewPicture.clipsToBounds = false
        containerViewPicture.layer.shadowColor = UIColor.white.cgColor
        containerViewPicture.layer.shadowOpacity = 1
        containerViewPicture.layer.shadowOffset = CGSize.zero
        containerViewPicture.layer.shadowRadius = 2
        
        containerViewPicture.layer.cornerRadius = containerViewPicture.frame.size.height/2
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.size.height/2
    }
    
    private func fetchData(){
        self.viewModel.fetchUrlImagesList(completion: {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ManyPuppiesVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getCountImages()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! PictureCollectionViewCell
        
        cell.configure(urlString: self.viewModel.dogs?.message![indexPath.row] ?? "https://dog.ceo/api/img/bulldog-boston/n02096585_10380.jpg")

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //TODO: Change value for iPhone 5, look good for < iphone 6
        return CGSize(width: 110, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //TODO: Change value for iPhone 5, look good for < iphone 6
        return UIEdgeInsets(top: 15, left: 15, bottom: 10, right: 15)
    }
}
