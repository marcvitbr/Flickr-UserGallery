//
//  GetImageInfo.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

final class GetImageInfo: ParameterizedUseCase {
    typealias Parameter = String

    private weak var fetcher: ImageInfoFetcher?

    private weak var receiver: ImageInfoReceiver?

    init(fetcher: ImageInfoFetcher, receiver: ImageInfoReceiver) {
        self.fetcher = fetcher
        self.receiver = receiver
    }

    func execute(with parameters: String) {
        guard let info = try? self.fetcher?.getImageInfo(photoId: parameters) else {
            self.receiver?.handleErrorGettingImageInfo()
            return
        }

        self.receiver?.receiveImageInfo(info)
    }
}
