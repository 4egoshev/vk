//
//  Router.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    private var basePath: String {
        switch self {
        case .authtorization:
            return "https://oauth.vk.com/authorize"
        default:
            return "https://api.vk.com/method/"
        }
    }
//    private var basePath: String {
//       return "https://api.vk.com/method/"
//    }
    
    case authtorization(params:AuthtorizationParams)
    case getFriends(params: FriendsParamsStruct)
    
    private var methodPath: String {
        switch self {
        case .authtorization : return ""
        case .getFriends     : return "friends.get"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .authtorization : return .get
        case .getFriends     : return .get
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .authtorization(let params):
            return SerializeJSONHelper.helper.getAuthtorizationParams(params)
        case .getFriends(let params):
            return SerializeJSONHelper.helper.getFriendsParams(params)
        }
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get : return URLEncoding.default
        default   : return JSONEncoding.default
        }
    }
    
    private var token: String? {
        switch self {
        case .authtorization : return nil
        case .getFriends     : return String.kAuthenticationToken
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try basePath.asURL()
        
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(methodPath))
        urlRequest.httpMethod      = method.rawValue
        urlRequest.cachePolicy     = .reloadIgnoringLocalAndRemoteCacheData
        urlRequest.timeoutInterval = 60
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        if method == .post || method == .put {
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        if let token = token {
            urlRequest.addValue(token, forHTTPHeaderField: "AuthenticationToken")
        }
        return try encoding.encode(urlRequest, with: parameters)
    }
}
