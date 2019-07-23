//
//  FlickrInfoProvider.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class FlickrInfoProvider {
    private static let apiKey = "6663ec0a677ebe14ea76a3607c6c6cd6"

    static let apiURL = URL(string: "https://api.flickr.com/services/rest")!

    static func parametersForGetPublicPhotos(userId: String, page: Int) -> [String: String] {
        return ["method": "flickr.people.getPublicPhotos",
                "api_key": FlickrInfoProvider.apiKey,
                "user_id": userId,
                "format": "json",
                "nojsoncallback": "1",
                "page": String(page),
                "per_page": "50"]
    }

    static func parametersForGetSizesMethod(photoId: String) -> [String: String] {
        return ["method": "flickr.photos.getSizes",
                "api_key": FlickrInfoProvider.apiKey,
                "photo_id": photoId,
                "format": "json",
                "nojsoncallback": "1"]
    }

    static func parametersForGetInfoMethod(photoId: String) -> [String: String] {
        return ["method": "flickr.photos.getInfo",
                "api_key": FlickrInfoProvider.apiKey,
                "photo_id": photoId,
                "format": "json",
                "nojsoncallback": "1"]
    }
}
