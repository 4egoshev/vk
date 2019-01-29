//
//  LoginViewController.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit

class LoginViewController: VKViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        present(OAuthViewController(), animated: true, completion: nil)
    }
}
