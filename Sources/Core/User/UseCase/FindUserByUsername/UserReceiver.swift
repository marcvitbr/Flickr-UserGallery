//
//  UserReceiver.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 24/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

protocol UserReceiver: AnyObject {
    func receiveUser(_ user: User)
    func handleErrorFindingUser()
}
