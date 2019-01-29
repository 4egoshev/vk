//
//  SerializeJSONHelper.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit

class SerializeJSONHelper: NSObject {

    static var helper = SerializeJSONHelper()
    
    func getAuthtorizationParams(_ params: AuthtorizationParams) -> Dictionary<String, Any> {
        return ["client_id"     : params.clientID,
                "redirect_uri"  : params.redirectURI,
                "display"       : params.display,
                "scope"         : params.scope,
                "response_type" : params.responseType,
                "v"             : params.version]
    }
    
    func getFriendsParams(_ params: FriendsParamsStruct) -> Dictionary<String, Any> {
        return ["user_id"   : params.user_id,
                "order"     : params.order,
                "count"     : params.count,
                "fields"    : params.fields,
                "name_case" : params.nameCase]
    }
}
