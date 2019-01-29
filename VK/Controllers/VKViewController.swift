//
//  VKViewController.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit

class VKViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func addMenuButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Меню", style: .plain, target: self, action: #selector(showMenu(_:)))
    }
    
    @objc func showMenu(_ sender: UIBarButtonItem) {
        ScreenManager.pushMainMenu()
    }
}
