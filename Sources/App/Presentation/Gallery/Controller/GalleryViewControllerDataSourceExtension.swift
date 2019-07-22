//
//  GalleryViewControllerDataSourceExtension.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation
import UIKit

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.currentImages.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }

        let summary = self.currentImages[indexPath.row]

        cell.updateSummary(summary)

        cell.startFetchingUrls()

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        if indexPath.row == self.currentImages.count - 1 {
            self.currentQuery.nextPage()
            self.fetchPublicImages(with: self.currentQuery)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let identifier = ImageCollectionLoadingFooterView.identifier

        guard kind == UICollectionView.elementKindSectionFooter,
            let footerView =
            collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                            withReuseIdentifier: identifier,
                                                            for: indexPath) as? ImageCollectionLoadingFooterView else {
                                                                return UICollectionReusableView()
        }

        footerView.animate()

        return footerView
    }
}
