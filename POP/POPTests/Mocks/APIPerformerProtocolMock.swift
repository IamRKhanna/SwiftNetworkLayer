//
//  APIPerformerProtocolMock.swift
//  POPTests
//
//  Created by Rahul on 27/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Foundation
@testable import Alamofire
@testable import POP

class APIPerformerProtocolMock: APIPerformerProtocol {
    func perform<T>(request: URLRequestConvertible, completionHandler: @escaping (URLRequest?, T?, Error?) -> Void) where T : Decodable, T : Encodable { }
    
    var invokedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoid = false
    var invokedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoidCount = 0
    var invokedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoidParameters: (request: URLRequestConvertible, Void)?
    var invokedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoidParametersList = [(request: URLRequestConvertible, Void)]()
    var stubbedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoidCompletionHandlerResult: (URLRequest?, Data?, Error?)?
    func perform(request: URLRequestConvertible, completionHandler: @escaping (_ request: URLRequest?, _ response: Data?, _ error: Error?) -> Void) {
        invokedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoid = true
        invokedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoidCount += 1
        invokedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoidParameters = (request, ())
        invokedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoidParametersList.append((request, ()))
        if let result = stubbedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoidCompletionHandlerResult {
            completionHandler(result.0, result.1, result.2)
        }
    }
}
