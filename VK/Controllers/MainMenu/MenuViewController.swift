//
//  MenuViewController.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit

struct MainMenuItem {
    var title = ""
    var section: MainMenuSection
}

class MenuViewController: VKViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let topInset: CGFloat = 50
    
    var items = [MainMenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.tableHeaderView = UIView(frame: .zero)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
        tableView.registerCellFromNib(MenuCell.self)
    }
}
