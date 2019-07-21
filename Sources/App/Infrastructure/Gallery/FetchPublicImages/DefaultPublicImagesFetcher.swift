//
//  DefaultPublicImagesFetcher.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class DefaultPublicImagesFetcher: PublicImagesFetcher {
    private let httpClient: HTTPClient

    private let parser: ImageSummaryJSONParser

    init(httpClient: HTTPClient, parser: ImageSummaryJSONParser) {
        self.httpClient = httpClient
        self.parser = parser
    }

    func fetchImages(query: Query) throws -> [ImageSummary] {
        let parameters = FlickrInfoProvider.parametersForGetPublicPhotos(userId: query.userId,
                                                                         page: query.page)

        let result = self.httpClient.get(FlickrInfoProvider.apiURL,
                                         parameters: parameters)

        guard case .success(let imagesJson) = result,
            let images = try? self.parser.parse(from: imagesJson) else {
            throw PublicImagesFetcherError.errorFetchingImages
        }

        return images
    }
}
