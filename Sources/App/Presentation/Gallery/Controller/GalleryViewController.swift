//
//  GalleryViewController.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation
import UIKit

class GalleryViewController: UIViewController, DependencyReceiver {
    @IBOutlet weak var collectionView: UICollectionView!

    internal var currentImages = [ImageSummary]()
    internal var currentQuery: Query!

    private var urlsFetcher: ImageUrlsFetcher!
    private var searchExecutor: FetchPublicImagesExecutor!
    private var presenter: GalleryPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurePresenter()

        self.configureCollectionView()

        self.fetchPublicImages(from: "49191827@N00")
    }

    internal func fetchPublicImages(from userId: String) {
        self.currentQuery = Query(userId: userId)
        self.fetchPublicImages(with: self.currentQuery)
    }

    internal func fetchPublicImages(with query: Query) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.presenter.fetchImages(with: query)
        }
    }

    private func configurePresenter() {
        self.urlsFetcher = self.instance(of: ImageUrlsFetcher.self)
        self.searchExecutor = self.instance(of: FetchPublicImagesExecutor.self)
        self.presenter = GalleryPresenter(screen: self, fetchExecutor: self.searchExecutor)
    }

    private func configureCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(UINib.init(nibName: String(describing: ImageCollectionViewCell.self),
                                                bundle: nil),
                                     forCellWithReuseIdentifier: ImageCollectionViewCell.cellIdentifier)

        self.collectionView.register(ImageCollectionLoadingFooterView.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                     withReuseIdentifier: ImageCollectionLoadingFooterView.identifier)
    }
}
