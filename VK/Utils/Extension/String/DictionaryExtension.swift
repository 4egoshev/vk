//
//  DictionaryExtension.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import Foundation

extension Dictionary {

    static func queryDictionary(request: URLRequest) -> Dictionary<String, String>? {
        var dict = [String: String]()
        guard request.url?.path == String.blank, let fragment = request.url?.fragment else { return nil }
        let _ = fragment.components(separatedBy: "&").map { $0.components(separatedBy: "=") }.reduce([String : String]()) { (result, param) in
            dict = result
            let key = param.first
            let value = param.last
            dict[key!] = value
            return dict
        }
        return dict
    }
}
