//
//  UIViewExtension.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    class func loadFromNib() -> UIView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: self, options: nil)?.first as! UIView
    }
    
    class func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
