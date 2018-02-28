//
//  Extensions.swift
//  DoggitosApp
//
//  Created by Nelson Ramirez on 2/27/18.
//  Copyright © 2018 Nelson Ramirez. All rights reserved.
//

import Foundation
import UIKit

//let imageCache = NSCache<AnyObject, AnyObject>()

//OBS: Commented code, because i cant fix yet a bug, srry
extension UIImageView{
    
//    var imageUrlString : String?
    
    func loadImageFromUrl(urlString : String){
        
//        imageUrlString = urlString
        let url = NSURL(string: urlString)
        image = nil
        
//        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
//            self.image = imageFromCache
//            return
//        }
        
        URLSession.shared.dataTask(with: url! as URL) {
            data, response, error in
            
            if error != nil{
                print(error?.localizedDescription ?? "")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            
//            DispatchQueue.main.async {
//                let imageToCache = UIImage(data: data!)
//                if self.imageUrlString == urlString{
//                    self.image = imageToCache
//                }
//                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
//            }
            
            
        }.resume()
    }
    
}
