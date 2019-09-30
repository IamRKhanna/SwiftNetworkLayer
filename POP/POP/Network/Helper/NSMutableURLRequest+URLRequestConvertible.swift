//
//  NSMutableURLRequest+URLRequestConvertible.swift
//  POP
//
//  Created by Rahul on 26/09/19.
//  Copyright © 2019 Rahul. All rights reserved.
//

import Alamofire

extension NSMutableURLRequest: URLRequestConvertible {
    public func asURLRequest() throws -> URLRequest {
        return self as URLRequest
    }
}

extension Request {
    func log() -> Self {
        
        #if DEBUG
        debugPrint(self)
        #endif
        
        return self
    }
}
