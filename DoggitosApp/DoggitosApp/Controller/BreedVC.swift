//
//  BreedVC.swift
//  DoggitosApp
//
//  Created by Nelson Ramirez on 2/26/18.
//  Copyright © 2018 Nelson Ramirez. All rights reserved.
//

import UIKit

class BreedVC: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var viewTextfield: UIView!
    @IBOutlet var textFieldSearch: UITextField!
    
    private var viewModel = BreedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        
        fetchData()
    }
    
    func configView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController?.navigationBar.isHidden = true
        
        textFieldSearch.attributedPlaceholder = NSAttributedString(string: "Buscar..", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        viewTextfield.layer.cornerRadius = 25
        
        let nib = UINib(nibName: "BreedCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "customCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func fetchData(){
        self.viewModel.fetchBreedList(completion: {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
}

extension BreedVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.getCountBreeds()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! BreedCollectionViewCell
        
        cell.configure(breedName: self.viewModel.breed?.message![indexPath.row] ?? "")

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVC = ManyPuppiesVC()
        newVC.breedName = self.viewModel.breed?.message![indexPath.row] ?? ""
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //TODO: Change value for iPhone 5, look good for < iphone 6
        return CGSize(width: 100, height: 120)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //TODO: Change value for iPhone 5, look good for < iphone 6
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
