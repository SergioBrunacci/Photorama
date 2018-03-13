//
//  Photo.swift
//  Photorama
//
//  Created by Sergio de Almeida Brunacci on 2018-03-12.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import Foundation

class Photo {
    let tittle: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    init(tittle: String, photoID: String, remoteURL: URL, dateTaken: Date){
        self.tittle = tittle
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
    }
    
}
