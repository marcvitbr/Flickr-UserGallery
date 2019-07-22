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
        if !self.currentQuery.isFirstPage() {
            return
        }

        self.currentImages = []

        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    func presentImages(_ images: [ImageSummary]) {
        if self.currentQuery.isFirstPage() {
            self.currentImages = images

            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }

            return
        }

        let currentCount = self.currentImages.count

        self.currentImages += images

        DispatchQueue.main.async {
            self.collectionView.performBatchUpdates({
                let newIndexes = (currentCount..<(currentCount + images.count))
                    .map { IndexPath(row: $0, section: 0) }

                self.collectionView.insertItems(at: newIndexes)
            }, completion: nil)
        }
    }

    func presentErrorWhenFetchingImages() {
        let errorMessage = "Sorry, something went wrong when fetching the images. Please try again."

        let alert = UIAlertController(title: "Oops!",
                                      message: errorMessage,
                                      preferredStyle: .alert)

        self.present(alert, animated: true, completion: nil)
    }
}
