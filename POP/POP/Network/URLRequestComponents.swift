//
//  URLRequestComponents.swift
//  POP
//
//  Created by Rahul on 28/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Foundation
import Alamofire

protocol URLRequestComponentsProtocol {
    var method: Alamofire.HTTPMethod { get }
    var encoding: Alamofire.ParameterEncoding { get }
    
    var path: String { get }
    var parameters: [String: AnyObject]? { get }
    var extraHeaders: [String: String]? { get }
}

extension URLRequestComponentsProtocol {
    
}
