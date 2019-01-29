//
//  NetworkHelper.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit
import Alamofire

var isLogEnable = true

class NetworkHelper: NSObject {
    
    static var helper = NetworkHelper()
    
    typealias StringCompletion = (String) -> Void
    typealias VoidCompletion = () -> Void
    
    typealias AuthtorizationCompletion = (URLRequest) -> Void
    typealias GetFriendsCompletion = () -> Void
    
    func getAuth(params: AuthtorizationParams, completion: @escaping AuthtorizationCompletion) {
        let request = Alamofire.request(Router.authtorization(params: params)).request
        completion(request!)
    }

    func getFriends(params: FriendsParamsStruct, completion: @escaping GetFriendsCompletion, failure: @escaping StringCompletion) {
        
        Alamofire.request(Router.getFriends(params: params)).responseJSON { (response) in
            VKUtils.logResponse(response)
        }
    }
}
