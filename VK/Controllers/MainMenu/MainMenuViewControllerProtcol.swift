//
//  MainMenuViewControllerProtcol.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import Foundation
import UIKit

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MenuCell.self), for: indexPath) as! MenuCell
        cell.title = items[indexPath.row].title
        return cell.construct()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ScreenManager.selectSection(with: items[indexPath.row].section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
