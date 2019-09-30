//
//  BaseService.swift
//  POP
//
//  Created by Rahul on 26/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Foundation
import Alamofire

class BaseService {
    let apiPerformer: APIPerformerProtocol
    let sessionConfiguration: APISessionConfigurationProtocol
    
    required init(apiPerformer: APIPerformerProtocol, sessionConfiguration: APISessionConfigurationProtocol) {
        self.apiPerformer = apiPerformer
        self.sessionConfiguration = sessionConfiguration
    }
    
    func createRequest<T: URLRequestComponentsProtocol>(forRequest request: T) -> URLRequestConvertible {
        return URLRequestBuilder(components: request, sessionConfiguration: sessionConfiguration)
    }
}
