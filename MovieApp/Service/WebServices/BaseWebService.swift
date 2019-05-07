//
//  BaseWebService.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

protocol BaseWebService {
    func request<T:Decodable> (urlString: String,
                     httpMethod: HTTPMethod,
                     parameters: [String: Any],
                     onSuccess:@escaping (T)->Void,
                     onError: @escaping (Error)->Void)
}

extension BaseWebService {
    func request<T:Decodable> (urlString: String,
                     httpMethod: HTTPMethod = .get,
                     parameters: [String: Any] = [:],
                     onSuccess:@escaping (T)->Void,
                     onError: @escaping (Error)->Void) {
        guard let url = URL(string: urlString) else {
            onError(WebServiceError.urlParsingFailed)
            return
        }
        Alamofire.request(url,
                          method: httpMethod,
                          parameters: parameters).responseDecodableObject { (response:DataResponse<T>) in
                            switch response.result {
                            case .success(let value):
                                onSuccess(value)
                            case .failure(let error):
                                onError(error)
                            }
        }
    }
}


enum WebServiceError: Error {
    case urlParsingFailed
}

