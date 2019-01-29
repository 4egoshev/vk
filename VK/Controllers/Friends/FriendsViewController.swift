//
//  FriendsViewController.swift
//  VK
//
//  Created by Александр Чегошев on 18.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit

class FriendsViewController: VKViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let params = FriendsParamsStruct(user_id: "92247711",
                                         order: "random",
                                         count: 50,
                                         fields: "photo_50,photo_100,city,online,last_seen,status",
                                         nameCase: "nom")
        NetworkHelper.helper.getFriends(params: params, completion: {
            
        }) { (error) in
            
        }
    }
}
