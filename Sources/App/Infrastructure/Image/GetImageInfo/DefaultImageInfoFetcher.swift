//
//  DefaultImageInfoFetcher.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class DefaultImageInfoFetcher: ImageInfoFetcher {
    private static var cache = [String: ImageInfo]()

    private let httpClient: HTTPClient

    private let parser: ImageInfoJSONParser

    init(httpClient: HTTPClient, parser: ImageInfoJSONParser) {
        self.httpClient = httpClient
        self.parser = parser
    }

    func getImageInfo(photoId: String) throws -> ImageInfo {
        if let cachedInfo = DefaultImageInfoFetcher.cache[photoId] {
            return cachedInfo
        }

        let parameters = FlickrInfoProvider.parametersForGetInfoMethod(photoId: photoId)

        let result = self.httpClient.get(FlickrInfoProvider.apiURL, parameters: parameters)

        guard case .success(let infoJson) = result,
            let imageInfo = try? self.parser.parse(from: infoJson) else {
            throw ImageInfoFetcherError.errorGettingImageInfo
        }

        DefaultImageInfoFetcher.cache[photoId] = imageInfo

        return imageInfo
    }
}
