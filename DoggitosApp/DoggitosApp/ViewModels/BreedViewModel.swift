//
//  BreedViewModel.swift
//  DoggitosApp
//
//  Created by Nelson Ramirez on 2/27/18.
//  Copyright © 2018 Nelson Ramirez. All rights reserved.
//

import Foundation

class BreedViewModel {
    
    var breed : Breed?
    
    func fetchBreedList(completion: @escaping () -> ()){
        
        let urlBreed = "https://dog.ceo/api/breeds/list"
        let url = URL(string: urlBreed)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print(error?.localizedDescription ?? "")
                completion()
                return
            }
            
            do {
                self.breed = try JSONDecoder().decode(Breed.self, from: data!)
                completion()
            }catch let jsonErr{
                print("error json: ",jsonErr)
            }
        }.resume()
    }
    
    func getCountBreeds() -> Int{
        if let count = breed?.message?.count{
            return count
        }else{
            return 0
        }
    }
    
}
