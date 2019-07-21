//
//  HTTPClient.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

protocol HTTPClient {
    func get(_ url: URL, parameters: [String: Any]) -> Result<[String: Any], Error>
}
