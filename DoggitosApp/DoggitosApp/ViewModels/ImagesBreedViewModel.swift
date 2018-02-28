//
//  ImagesBreedViewModel.swift
//  DoggitosApp
//
//  Created by Nelson Ramirez on 2/27/18.
//  Copyright © 2018 Nelson Ramirez. All rights reserved.
//

import Foundation

class ImagesBreedViewModel{
    
    var dogs : Dogs?
    
    var breedName : String = ""

    func fetchUrlImagesList(completion: @escaping () -> ()){
        
        let urlBreed = "https://dog.ceo/api/breed/\(self.breedName)/images"
        let url = URL(string: urlBreed)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print(error?.localizedDescription ?? "")
                completion()
                return
            }
            
            do {
                self.dogs = try JSONDecoder().decode(Dogs.self, from: data!)
//                print(self.dogs)
                completion()
            }catch let jsonErr{
                print("error json: ",jsonErr)
            }
        }.resume()
    }
    
    func getCountImages() -> Int{
        if let count = dogs?.message?.count{
            return count
        }else{
            return 0
        }
    }
}
