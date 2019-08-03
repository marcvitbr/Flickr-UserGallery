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

        let defaultUserParser = DefaultUserJSONParser()
        dependencies.register(UserJSONParser.self, instance: defaultUserParser)
        dependencies.register(UserFinder.self,
                              instance: DefaultUserFinder(httpClient: defaultHttpClient,
                                                          parser: defaultUserParser))

        dependencies.register(GetImageUrlsExecutor.self, instance: DefaultGetImageUrlsExecutor())

        dependencies.register(GetImageInfoExecutor.self, instance: DefaultGetImageInfoExecutor())

        dependencies.register(FetchPublicImagesExecutor.self, instance: DefaultFetchPublicImagesExecutor())

        dependencies.register(FindUserByUsernameExecutor.self, instance: DefaultFindUserByUsernameExecutor())

        dependencies.printInstances()
    }
}
