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
    @IBOutlet weak var searchBar: UISearchBar!

    internal var currentImages = [ImageSummary]()
    internal var currentQuery: Query!

    private var findUserExecutor: FindUserByUsernameExecutor!
    private var urlsFetcher: ImageUrlsFetcher!
    private var searchExecutor: FetchPublicImagesExecutor!
    private var presenter: GalleryPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureSearchBar()

        self.configurePresenter()

        self.configureCollectionView()
    }

    internal func findUser(_ username: String) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.presenter.findUser(username)
        }
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

    private func configureSearchBar() {
        self.searchBar.placeholder = "SearchFieldPlaceholderText".localized()
        self.searchBar.delegate = self
    }

    private func configurePresenter() {
        self.urlsFetcher = self.instance(of: ImageUrlsFetcher.self)
        self.searchExecutor = self.instance(of: FetchPublicImagesExecutor.self)
        self.findUserExecutor = self.instance(of: FindUserByUsernameExecutor.self)
        self.presenter = GalleryPresenter(screen: self,
                                          fetchExecutor: self.searchExecutor,
                                          findUserExecutor: self.findUserExecutor)
    }

    private func configureCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(UINib(nibName: String(describing: ImageCollectionViewCell.self),
                                           bundle: nil),
                                     forCellWithReuseIdentifier: ImageCollectionViewCell.cellIdentifier)

        self.collectionView.register(ImageCollectionLoadingFooterView.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                     withReuseIdentifier: ImageCollectionLoadingFooterView.identifier)
    }
}
