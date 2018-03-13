//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Sergio de Almeida Brunacci on 2018-03-12.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import Foundation

enum Method: String {
    case landscapePhotos = "flickr.landscape.getList"
}

struct FlickrAPI {
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "a6d819499131071f158fd740860a5a88"
    
    private static func flickrURL(method: Method, parameters: [String:String]?) -> URL{
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method": method.rawValue,
            "format":"json",
            "nojsoncallback":"1",
            "api_key": apiKey
        ]
        
        for (key, value) in baseParams{
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters{
            for (key, value) in additionalParams{
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!
    }
    
    var landscapePhotosURL: URL{
        return FlickrAPI.flickrURL(method: .landscapePhotos, parameters: ["extras": "url_h,date_taken"])
    }
}
