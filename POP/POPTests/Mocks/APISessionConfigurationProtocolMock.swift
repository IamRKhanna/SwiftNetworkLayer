//
//  APISessionConfigurationProtocolMock.swift
//  POPTests
//
//  Created by Rahul on 27/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Foundation
@testable import POP

class APISessionConfigurationMock: APISessionConfigurationProtocol {
    var invokedBaseURLGetter = false
    var invokedBaseURLGetterCount = 0
    var stubbedBaseURL: String! = ""
    var baseURL: String {
        invokedBaseURLGetter = true
        invokedBaseURLGetterCount += 1
        return stubbedBaseURL
    }
}
