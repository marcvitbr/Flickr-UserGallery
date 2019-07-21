//
//  FetchPublicImages.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class FetchPublicImages: ParameterizedUseCase {
    typealias Parameter = Query

    private weak var fetcher: PublicImagesFetcher?

    private weak var receiver: PublicImagesReceiver?

    init(fetcher: PublicImagesFetcher, receiver: PublicImagesReceiver) {
        self.fetcher = fetcher
        self.receiver = receiver
    }

    func execute(with parameters: Query) {
        guard let images = try? self.fetcher?.fetchImages(query: parameters) else {
            self.receiver?.handleErrorFetchingImageSummaries()
            return
        }

        self.receiver?.receiveImageSummaries(images)
    }
}
