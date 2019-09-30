//
//  Network.swift
//  POP
//
//  Created by Rahul on 28/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Foundation

class Network {
    private var sessionConfiguration: APISessionConfigurationProtocol
    private let apiPerformer: APIPerformerProtocol = APIPerformer()
    
    
    init(sessionConfiguration: APISessionConfigurationProtocol) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    // Expose Services
    func searchService() -> SearchServiceProtocol {
        return SearchService(apiPerformer: apiPerformer, sessionConfiguration: sessionConfiguration)
    }
}
