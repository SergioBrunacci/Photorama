//
//  PhotoStore.swift
//  Photorama
//
//  Created by Sergio de Almeida Brunacci on 2018-03-12.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import Foundation

class PhotoStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchLandscapePhotos(){
        let url = FlickrAPI.landscapePhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            if let jsonData = data {
                if let jsonString = String(data: jsonData, encoding: .utf8){
                    print(jsonString)
                }
            } else if let requestError = error{
                print("Error fetching landscape photos: \(requestError)")
            } else {
                print("Unexpected error with the request")
            }
            
        }
        task.resume()
    }
}
