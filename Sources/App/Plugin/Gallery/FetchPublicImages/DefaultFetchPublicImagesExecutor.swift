//
//  DefaultFetchPublicImagesExecutor.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class DefaultFetchPublicImagesExecutor: FetchPublicImagesExecutor, PublicImagesReceiver, DependencyReceiver {
    private var semaphore: DispatchSemaphore!

    private var retrievedSummaries: [ImageSummary]?

    private var isSuccess = false

    func executeFetchPublicImages(with query: Query) throws -> [ImageSummary] {
        guard let defaultFetcher = self.instance(of: PublicImagesFetcher.self) else {
            throw FetchPublicImagesExecutorError.errorExecutingFetchPublicImages
        }

        self.resetExecutionFlags()

        let fetchPublicImages = FetchPublicImages(fetcher: defaultFetcher,
                                                  receiver: self)

        fetchPublicImages.execute(with: query)

        self.semaphore.wait()

        guard self.isSuccess, let info = self.retrievedSummaries else {
            throw FetchPublicImagesExecutorError.errorExecutingFetchPublicImages
        }

        return info
    }

    func receiveImageSummaries(_ images: [ImageSummary]) {
        self.retrievedSummaries = images
        self.resumeExecution(success: true)
    }

    func handleErrorFetchingImageSummaries() {
        self.retrievedSummaries = nil
        self.resumeExecution(success: false)
    }

    private func resetExecutionFlags() {
        self.isSuccess = false
        self.semaphore = DispatchSemaphore(value: 0)
    }

    private func resumeExecution(success: Bool) {
        self.isSuccess = success
        self.semaphore.signal()
    }
}
