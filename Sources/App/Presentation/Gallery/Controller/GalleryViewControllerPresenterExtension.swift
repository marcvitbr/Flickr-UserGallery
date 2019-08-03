//
//  GalleryViewControllerPresenterExtension.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 22/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation
import UIKit

extension GalleryViewController: GalleryScreen {
    func clearResultsView() {
        DispatchQueue.main.async {
            guard let query = self.currentQuery, query.isFirstPage() else {
                return
            }

            self.currentImages = []

            self.collectionView.reloadData()
        }
    }

    func prepareScreenForFetchImages(of user: User) {
        DispatchQueue.main.async {
            self.fetchPublicImages(from: user.identifier)
        }
    }

    func presentImages(_ images: [ImageSummary]) {
        DispatchQueue.main.async {
            if self.currentQuery.isFirstPage() {
                self.currentImages = images
                self.collectionView.reloadData()
                return
            }

            let currentCount = self.currentImages.count

            self.currentImages += images

            self.collectionView.performBatchUpdates({
                let newIndexes = (currentCount..<(currentCount + images.count))
                    .map { IndexPath(row: $0, section: 0) }

                self.collectionView.insertItems(at: newIndexes)
            }, completion: nil)
        }
    }

    func presentErrorWhenFindingUser() {
        self.presentErrorAlert(message: "ErrorMessageFindingUser".localized())
    }

    func presentErrorWhenFetchingImages() {
        self.presentErrorAlert(message: "ErrorMessageFetchingImages".localized())
    }

    internal func presentErrorAlert(message: String) {
        DispatchQueue.main.async {
            let alert = Alerts.genericAlert(message: message)

            self.present(alert, animated: true, completion: nil)
        }
    }
}
