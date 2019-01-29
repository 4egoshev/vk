//
//  VKUtils.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit
import Alamofire

class VKUtils: NSObject {

    //MARK: - Logs
    class func logResponse(_ response: DataResponse<Any>) {
        if isLogEnable {
            print("-------------------------")
            if let request = response.request {
                print("REQUEST: \(request)")
            }
            if let header = response.request?.allHTTPHeaderFields {
                print("HEADER: \(header)")
            }
            if let response = response.response {
                print("STATUS CODE: \(response.statusCode)")
            }
            print(response.description)
            print("-------------------------")
        }
    }
}
