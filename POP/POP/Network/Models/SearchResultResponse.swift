//
//  SearchResultResponse.swift
//  POP
//
//  Created by Rahul on 27/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Foundation

struct SearchResultResponse: Codable {
    let relatedTopics: [RelatedResult]
    
    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}

struct RelatedResult: Codable {
    let text: String?
    let firstUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case text = "Text"
        case firstUrl = "FirstURL"
    }
}
