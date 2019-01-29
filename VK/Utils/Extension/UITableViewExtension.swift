//
//  UITableViewExtension.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCellFromNib(_ cell: UITableViewCell.Type) {
        self.register(cell.nib(), forCellReuseIdentifier: String(describing: cell))
    }
    
    func registerCellFromClass(_ cell: AnyClass) {
        self.register(cell, forCellReuseIdentifier: String(describing: cell))
    }
}
