//
//  ViewController.swift
//  Flo
//
//  Created by Caroline Begbie on 15/04/2015.
//  Copyright (c) 2015 Caroline Begbie. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
  var isGraphViewShowing = false
    
  //Counter outlets
  @IBOutlet weak var counterView: CounterView!
  @IBOutlet weak var counterLabel: UILabel!
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var graphView: GraphView!
  //Label outlets
  @IBOutlet weak var averageWaterDrunk: UILabel!
  @IBOutlet weak var maxLabel: UILabel!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    counterLabel.text = String(counterView.counter)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func btnPushButton(button: PushButtonView) {
    if button.isAddButton
    {
      counterView.counter++
    }
    else
    {
      if counterView.counter > 0
      {
        counterView.counter--
      }
    }
    counterLabel.text = String(counterView.counter)
    
    if isGraphViewShowing{
        counterViewTap(nil)
    }
  }
    
    //tap function of UIView
    @IBAction func counterViewTap(gesture:UITapGestureRecognizer?) {
        if (isGraphViewShowing) {
            
            //hide Graph
            UIView.transitionFromView(graphView,
                toView: counterView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion:nil)
        } else {
            
            //show Graph
            //setupGraphDisplay()
            
            UIView.transitionFromView(counterView,
                toView: graphView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromRight
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }
    
    
    
}



