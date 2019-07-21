//
//  DefaultImageUrlsFetcher.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class DefaultImageUrlsFetcher: ImageUrlsFetcher {
    private static var cache = [String: ImageUrls]()

    private let httpClient: HTTPClient

    private let parser: ImageUrlsJSONParser

    init(httpClient: HTTPClient, parser: ImageUrlsJSONParser) {
        self.httpClient = httpClient
        self.parser = parser
    }

    func getImageUrls(photoId: String) throws -> ImageUrls {
        if let cachedUrls = DefaultImageUrlsFetcher.cache[photoId] {
            return cachedUrls
        }

        let parameters = FlickrInfoProvider.parametersForGetSizesMethod(photoId: photoId)

        let result = self.httpClient.get(FlickrInfoProvider.apiURL, parameters: parameters)

        guard case .success(let urlsJson) = result,
            let imageUrls = try? self.parser.parse(from: urlsJson, photoId) else {
            throw ImageUrlsFetcherError.errorGettingImageUrls
        }

        DefaultImageUrlsFetcher.cache[photoId] = imageUrls

        return imageUrls
    }
}
