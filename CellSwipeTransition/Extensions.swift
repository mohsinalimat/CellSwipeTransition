//
//  Extensions.swift
//  CellSwipeTransition
//
//  Created by Luke on 24/06/2017.
//  Copyright © 2017 Luke. All rights reserved.
//

import UIKit

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    
    static func randomColor() -> UIColor {
        return UIColor(red:   CGFloat.random(),
                       green: CGFloat.random(),
                       blue:  CGFloat.random(),
                       alpha: 1.0)
    }
    
}
