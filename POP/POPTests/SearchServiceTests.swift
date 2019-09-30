//
//  SearchServiceTests.swift
//  POPTests
//
//  Created by Rahul on 27/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

@testable import POP
import XCTest

class SearchServiceTests: XCTestCase {
    private var apiPerfomer: APIPerformerProtocolMock = APIPerformerProtocolMock()
    private var sessionConfiguration: APISessionConfigurationMock = APISessionConfigurationMock()
    private var searchService: SearchServiceProtocol!

    override func setUp() {
        super.setUp()
        
        searchService = SearchService(apiPerformer: apiPerfomer, sessionConfiguration: sessionConfiguration)
    }
    
    func testSearchService() {
        // Given
        apiPerfomer.invokedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoidCount = 0
        
        // When
        searchService.searchText(query: "Hi") { (response, error) in
        }
        
        // Verify
        XCTAssertEqual(1, apiPerfomer.invokedPerformRequestURLRequestConvertibleCompletionHandlerURLRequestDataErrorVoidCount)
    }
}
