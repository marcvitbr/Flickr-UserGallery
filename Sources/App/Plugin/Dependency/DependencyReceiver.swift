//
//  DependencyReceiver.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

protocol DependencyReceiver {}

extension DependencyReceiver {
    func instance<T>(of type: T.Type) -> T? {
        return DependencyProvider.shared.instance(of: T.self)
    }
}
