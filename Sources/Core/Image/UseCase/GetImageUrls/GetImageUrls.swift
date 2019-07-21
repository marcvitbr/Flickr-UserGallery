//
//  GetImageUrls.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class GetImageUrls: ParameterizedUseCase {
    typealias Parameter = String

    private weak var fetcher: ImageUrlsFetcher?

    private weak var receiver: ImageUrlsReceiver?

    init(fetcher: ImageUrlsFetcher, receiver: ImageUrlsReceiver) {
        self.fetcher = fetcher
        self.receiver = receiver
    }

    func execute(with parameters: String) {
        guard let details = try? self.fetcher?.getImageUrls(photoId: parameters) else {
            self.receiver?.handleErrorGettingImageUrls()
            return
        }

        self.receiver?.receiveImageUrls(details)
    }
}
