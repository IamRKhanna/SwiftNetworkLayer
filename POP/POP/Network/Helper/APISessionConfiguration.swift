//
//  APISessionConfiguration.swift
//  POP
//
//  Created by Rahul on 30/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Foundation

class APISessionConfiguration: APISessionConfigurationProtocol {
    var baseURL: String {
        return "https://api.duckduckgo.com"
    }
}
