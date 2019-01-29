//
//  MenuCell.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 4
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectedBackgroundView?.frame = containerView.frame
        selectedBackgroundView?.layer.cornerRadius = containerView.layer.cornerRadius
    }
    
    func construct() -> MenuCell {
        titleLabel.text = title
        return self
    }
}
