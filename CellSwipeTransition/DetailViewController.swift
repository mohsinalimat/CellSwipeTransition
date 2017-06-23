//
//  DetailViewController.swift
//  CellSwipeTransition
//
//  Created by Luke on 24/06/2017.
//  Copyright © 2017 Luke. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var indexPath: IndexPath
    
    var backgroundColor: UIColor
    
    init(indexPath: IndexPath, backgroundColor: UIColor) {
        self.indexPath = indexPath
        self.backgroundColor = backgroundColor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "detail vc at: \(indexPath.row)"
        
        view.backgroundColor = backgroundColor
    }
    
}
