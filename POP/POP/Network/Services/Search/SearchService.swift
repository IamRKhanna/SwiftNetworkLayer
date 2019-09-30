//
//  SearchService.swift
//  POP
//
//  Created by Rahul on 28/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Foundation

protocol SearchServiceProtocol {
    func searchText(query: String, completion: @escaping (SearchResultResponse?, Error?) -> Void)
}

class SearchService: BaseService, SearchServiceProtocol {
    func searchText(query: String, completion: @escaping (SearchResultResponse?, Error?) -> Void) {
        // 1. Create Request Component
        let requestComponent = SearchRequestComponent.search(query: query)
        
        // 2. Create a request object
        let request = URLRequestBuilder(components: requestComponent, sessionConfiguration: sessionConfiguration)
        
        // 3. Perform the request using APIPerformerProtocol
        // 3. Perform the request using APIPerformerProtocol
        apiPerformer.perform(request: request) { (_, response: SearchResultResponse?, error) in
            completion(response, error)
        }
    }
}
