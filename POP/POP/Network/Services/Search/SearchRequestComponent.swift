//
//  SearchRequestComponent.swift
//  POP
//
//  Created by Rahul on 28/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Foundation
import Alamofire

enum SearchRequestComponent: URLRequestComponentsProtocol {
    case search(query: String)
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var path: String {
        switch self {
        case .search:
            return ""
        }
    }
    
    var parameters: [String : AnyObject]? {
        switch self {
        case .search(let query):
            return ["q": query as AnyObject, "format": "json" as AnyObject]
        }
    }
    
    var extraHeaders: [String : String]? {
        return nil
    }
}
