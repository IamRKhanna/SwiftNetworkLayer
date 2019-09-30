//
//  APIPerformer.swift
//  POP
//
//  Created by Rahul on 28/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Foundation
import Alamofire

protocol APIPerformerProtocol {
    func perform(request: URLRequestConvertible, completionHandler: @escaping (_ request: URLRequest?, _ response: Data?, _ error: Error?) -> Void)
    func perform<T: Codable>(request: URLRequestConvertible, completionHandler: @escaping (_ request: URLRequest?, _ response: T?, _ error: Error?) -> Void)
}


class APIPerformer {
    fileprivate var sessionManager: SessionManager!
    fileprivate let queue: DispatchQueue = DispatchQueue(label: "com.POP.Network")
    
    init() {
        initSessionManager()
    }
    
    func initSessionManager() {
        let configuration = URLSessionConfiguration.default
        sessionManager = SessionManager(configuration: configuration)
    }
}

extension APIPerformer: APIPerformerProtocol {
    func perform(request: URLRequestConvertible, completionHandler: @escaping (_ request: URLRequest?, _ response: Data?, _ error: Error?) -> Void) {
        sessionManager.request(request).log().validate().responseJSON(queue: queue) { (response) in
            let request = response.request
            var responseData: Data? = nil
            var requestError: Error? = nil
            switch response.result {
            case .success:
                if let data = response.data {
                    responseData = data
                }
            case .failure(let error):
                requestError = error
            }
            DispatchQueue.main.async {
                completionHandler(request, responseData, requestError)
            }
        }
    }
    
    func perform<T: Codable>(request: URLRequestConvertible, completionHandler: @escaping (_ request: URLRequest?, _ response: T?, _ error: Error?) -> Void) {
        sessionManager.request(request).log().validate().responseJSON(queue: queue) { (response) in
            let request = response.request
            var responseData: T? = nil
            var requestError: Error? = nil
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        responseData = try JSONDecoder().decode(T.self, from: data)
                    } catch(let error) {
                        completionHandler(request, nil, error)
                    }
                }
            case .failure(let error):
                requestError = error
            }
            DispatchQueue.main.async {
                completionHandler(request, responseData, requestError)
            }
        }
    }
}
