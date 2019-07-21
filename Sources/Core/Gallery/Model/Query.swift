//
//  Query.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 20/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

struct Query {
    var userId: String

    var page = 1

    init(userId: String, page: Int = 1) {
        self.userId = userId
        self.page = 1
    }

    mutating func nextPage() {
        self.page += 1
    }

    func isFirstPage() -> Bool {
        return self.page == 1
    }
}
