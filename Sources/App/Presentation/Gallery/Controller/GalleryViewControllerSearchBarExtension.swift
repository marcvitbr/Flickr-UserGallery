//
//  GalleryViewControllerSearchBarExtension.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 31/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation
import UIKit

extension GalleryViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let username = self.searchBar.text {
            self.findUser(username)
        }

        self.searchBar.resignFirstResponder()
    }
}
