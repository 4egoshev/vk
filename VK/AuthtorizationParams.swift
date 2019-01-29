//
//  AuthtorizationParams.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import Foundation

enum Scope: Int {
    case notify        = 1
    case friends       = 2
    case photos        = 4
    case audio         = 8
    case video         = 16
    case stories       = 64
    case pages         = 128
    case status        = 1024
    case notes         = 2048
    case messages      = 4096
    case wall          = 8192
    case ads           = 32768
    case offline       = 65536
    case docs          = 131072
    case groups        = 262144
    case notifications = 524288
    case stats         = 1048576
    case email         = 4194304
    case market        = 134217728
}

enum Display: String {
    case page
    case popup
    case mobile
}

struct AuthtorizationParams {
    
    var clientID     = ""
    var redirectURI  = ""
    var display      = ""
    var scope        = 0
    var responseType = ""
    var version      = ""
}
