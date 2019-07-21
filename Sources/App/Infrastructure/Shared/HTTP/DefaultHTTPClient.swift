//
//  DefaultHTTPClient.swift
//  Flickr-UserGallery
//
//  Created by Marcelo Vitoria on 21/07/19.
//  Copyright © 2019 Marcelo Vitoria. All rights reserved.
//

import Foundation
import Alamofire

final class DefaultRequestInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (AFResult<URLRequest>) -> Void) {
        #if DEBUG
        print("##### \(urlRequest)")
        #endif
        completion(.success(urlRequest))
    }
}

final class DefaultHTTPClient: HTTPClient {
    private lazy var interceptor = DefaultRequestInterceptor()

    func get(_ url: URL, parameters: [String: Any]) -> Result<[String: Any], Error> {
        let request = AF.request(url,
                                 method: .get,
                                 parameters: parameters,
                                 encoding: URLEncoding.default,
                                 headers: nil,
                                 interceptor: self.interceptor)

        let semaphore = DispatchSemaphore(value: 0)

        var obtainedJson: [String: Any]?

        request.responseJSON { dataResponse in
            switch dataResponse.result {
            case let .success(values):
                guard let jsonValues = values as? [String: Any] else {
                    semaphore.signal()
                    return
                }

                obtainedJson = jsonValues
            default:
                break
            }

            semaphore.signal()
        }

        semaphore.wait()

        guard let jsonValues = obtainedJson else {
            return .failure(HTTPClientError.genericHTTPError)
        }

        return .success(jsonValues)
    }
}
