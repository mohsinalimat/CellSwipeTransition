//
//  ViewController.swift
//  CellSwipeTransition
//
//  Created by Luke on 23/06/2017.
//  Copyright © 2017 Luke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var backgroundColors: [IndexPath : UIColor] = [ : ]
    
    var swNavigationController: SWNavigationController {
        return navigationController as! SWNavigationController
    }
    
    /// The collectionView if you're not using UICollectionViewController
    lazy var collectionView: UICollectionView = {
        let cv: UICollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.layout)
        cv.backgroundColor = UIColor.white
        
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        cv.dataSource = self
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "chat vc"
        view.addSubview(collectionView)
        
        let panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(_:)))
        panGestureRecognizer.delegate = self
        collectionView.addGestureRecognizer(panGestureRecognizer)
        
        // Replace navigation controller's interactivePushGestureRecognizer with our own pan recognizer.
        // SWNavigationController uses uiscreenedgerecognizer by default which we don't need in our case.
        swNavigationController.interactivePushGestureRecognizer = panGestureRecognizer
    }
    
    func handlePan(_ recognizer: UIPanGestureRecognizer) {
        
        guard fabs(recognizer.translation(in: collectionView).x) > fabs(recognizer.translation(in: collectionView).y) else {
            return
        }
        
        // create the new view controller upon .began
        if recognizer.state == .began {
            
            // disable scrolling(optional)
            collectionView.isScrollEnabled = false
            
            // pan location
            let location: CGPoint = recognizer.location(in: collectionView)
            
            // get indexPath of cell where pan is taking place
            if let panCellIndexPath: IndexPath = collectionView.indexPathForItem(at: location) {
                
                // clear previously pushed viewControllers
                swNavigationController.pushableViewControllers.removeAllObjects()
                
                // create detail view controller for pan indexPath
                let dvc = DetailViewController(indexPath: panCellIndexPath, backgroundColor: backgroundColors[panCellIndexPath]!)
                
                swNavigationController.pushableViewControllers.add(dvc)
            }
        } else if recognizer.state != .changed {
            collectionView.isScrollEnabled = true
        }
        
        // let navigation controller handle presenting
        swNavigationController.handleRightSwipe(recognizer)
    }
    
    /// Custom flow layout
    lazy var layout: CustomFlowLayout = {
        let l: CustomFlowLayout = CustomFlowLayout()
        l.itemSize = CGSize(width: self.view.bounds.width / 1.5, height: 100)
        l.delegate = self
        
        return l
    }()
    
}

extension ViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

extension ViewController: UICollectionViewDataSource, CustomLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = cellSide(forIndexPath: indexPath) == .left ? UIColor.green : UIColor.randomColor()
        backgroundColors.updateValue(cell.backgroundColor!, forKey: indexPath)
        
        return cell
    }
    
    // MARK: CustomLayoutDelegate
    
    func cellSide(forIndexPath indexPath: IndexPath) -> CellSide {
        
        // TODO: Your implementation to distinguish left/right indexPath
        
        // Even rows are .right and Odds .left
        if indexPath.row % 2 == 0 {
            return .right
        } else {
            return .left
        }
    }
}


