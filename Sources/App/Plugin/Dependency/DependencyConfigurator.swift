//
//  DependencyConfigurator.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation

final class DependencyConfigurator {
    func configureDependencies() {
        let dependencies = DependencyProvider.shared

        dependencies.printInstances()
    }
}
