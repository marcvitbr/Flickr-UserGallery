//
//  DependencyConfigurator.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class DependencyConfigurator {
    func configureDependencies() {
        let dependencies = DependencyProvider.shared

        let defaultHttpClient = DefaultHTTPClient()
        dependencies.register(HTTPClient.self, instance: defaultHttpClient)

        let defaultImageUrlsParser = DefaultImageUrlsJSONParser()
        dependencies.register(ImageUrlsJSONParser.self, instance: defaultImageUrlsParser)
        dependencies.register(ImageUrlsFetcher.self,
                              creator: { DefaultImageUrlsFetcher(httpClient: defaultHttpClient,
                                                                 parser: defaultImageUrlsParser) })

        let defaultImageInfoParser = DefaultImageInfoJSONParser()
        dependencies.register(ImageInfoJSONParser.self, instance: defaultImageInfoParser)
        dependencies.register(ImageInfoFetcher.self,
                              instance: DefaultImageInfoFetcher(httpClient: defaultHttpClient,
                                                                parser: defaultImageInfoParser))

        let defaultImageSummaryParser = DefaultImageSummaryJSONParser()
        dependencies.register(ImageSummaryJSONParser.self, instance: defaultImageSummaryParser)
        dependencies.register(PublicImagesFetcher.self,
                              instance: DefaultPublicImagesFetcher(httpClient: defaultHttpClient,
                                                                   parser: defaultImageSummaryParser))

        dependencies.register(GetImageUrlsExecutor.self, instance: DefaultGetImageUrlsExecutor())

        dependencies.register(GetImageInfoExecutor.self, instance: DefaultGetImageInfoExecutor())

        dependencies.register(FetchPublicImagesExecutor.self, instance: DefaultFetchPublicImagesExecutor())

        dependencies.printInstances()
    }
}
