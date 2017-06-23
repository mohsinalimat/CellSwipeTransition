//
//  SWNavigationController.h
//  SWNavigationController
//
//  Created by Christopher Wendel on 12/31/14.
//  Copyright (c) 2014 Christopher Wendel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWNavigationController : UINavigationController <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

/** A gesture recognizer responsible for pushing the most recently popped view controller back onto the navigation stack. (read-only)
 *
 *  Handles the right-to-left edge swipe gesture. Disable this gesture recognizer to disable the interactive push of the next view controller.
 *  Enabled by default 
 *  NOTE: Changed tobe readwrite to enable replacing the recognizer with any UIPanGestureRecognizer
 */
@property (nonatomic, strong, readwrite) UIGestureRecognizer *interactivePushGestureRecognizer;

/** The Class that handles the push transition when a view controller is pushed onto the navigation stack.
 *
 *  A new instance of this Class is initialized when a push occurs.
 *  The Class must implement the protocol UIViewControllerAnimatedTransitioning.
 *  By default this is set to SWPushAnimatedTransitioning.
 */
@property (nonatomic, strong) Class pushAnimatedTransitioningClass;


/** The Class that handles the pop transition when a view controller is popped off the navigation stack.
 *
 *  A new instance of this Class is initialized when a pop occurs.
 *  The Class must implement the protocol UIViewControllerAnimatedTransitioning
 *  If this is nil, UINavigationController's default pop animation will be used.
 */
@property (nonatomic, strong) Class popAnimatedTransitioningClass;
   
/** 
  *  Expose gesture recognizer target
  */
- (void)handleRightSwipe:(UIPanGestureRecognizer *)swipeGestureRecognizer;
    
@property (nonatomic, strong) NSMutableArray *pushableViewControllers; // View controllers we can push onto the navigation stack by pulling in from the right screen edge.


@end
