//
//  CustomLayout.swift
//  CellSwipeTransition
//
//  Created by Luke on 24/06/2017.
//  Copyright © 2017 Luke. All rights reserved.
//

import UIKit

public enum CellSide {
    case right
    case left
}

protocol CustomLayoutDelegate: class {
    
    func cellSide(forIndexPath indexPath: IndexPath) -> CellSide
}

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    /// Delegates distinguishing between left and right items
    weak var delegate: CustomLayoutDelegate!
    
    /// Maximum alpha value
    let kMaxAlpha: CGFloat = 1
    
    /// Minimum alpha value. The alpha value you want the first visible item to have
    let kMinAlpha: CGFloat = 0.3
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let cv = collectionView, let rectAtts = super.layoutAttributesForElements(in: rect) else { return nil }
        
        for atts in rectAtts {
            
            // Skip left sides
            if delegate.cellSide(forIndexPath: atts.indexPath) == .left {
                continue
            }
            
            // Offset Y on visible bounds. you can use
            //      ´cv.bounds.height - (atts.frame.origin.y - cv.contentOffset.y)´
            // To reverse the effect
            let offset_y = (atts.frame.origin.y - cv.contentOffset.y)
            
            let alpha = offset_y * kMaxAlpha / cv.bounds.height
            
            atts.alpha = alpha + kMinAlpha
        }
        
        return rectAtts
    }
    
    // Invalidate layout when scroll happens. Otherwise atts won't be recalculated
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}



