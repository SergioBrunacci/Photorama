//
//  PhotoStore.swift
//  Photorama
//
//  Created by Sergio de Almeida Brunacci on 2018-03-12.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import Foundation

enum PhotoResult {
    case sucess([Photo])
    case failure(Error)
}

enum FlickrError: Error {
    case invalidJSONData
}

/*
enum Method: String {
    case landscapePhotos = "flickr.landscape.getList"
}
 */

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
                
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    print(jsonObject)
                } catch let error {
                    print("Error creating JSON object: \(error)")
                }
            } else if let requestError = error{
                print("Error fetching landscape photos: \(requestError)")
            } else {
                print("Unexpected error with the request")
            }
            
        }
        task.resume()
    }
    
    static func photos(fromJSON data: Data) -> PhotoResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            var finalPhotos = [Photo]()
            return .sucess(finalPhotos)
        } catch let error {
            return .failure(error)
        }
    }
    
    
}
