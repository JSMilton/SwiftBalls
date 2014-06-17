//
//  ViewController.swift
//  SwiftBalls
//
//  Created by James Milton on 07/06/2014.
//  Copyright (c) 2014 James Milton. All rights reserved.
//

import UIKit
import QuartzCore
import Foundation

class ViewController: UIViewController {
    
    let GRAVITY:CGPoint = CGPoint(x: 0,y: 1)
    
    var displayLink:CADisplayLink!
    var balls = Ball[]()
                            
    @IBOutlet var instructionsLabel : UILabel = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLink = CADisplayLink(target: self, selector: "step")
        displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapGesture(sender : UITapGestureRecognizer) {
        
        if (!instructionsLabel.hidden){
            UIView.animateWithDuration(1.0, animations: {self.instructionsLabel.alpha = 0.0})
        }
        
        let newBall = Ball(startPt: sender.locationInView(self.view), size: CGSize(width: 20, height: 20), force: GRAVITY, pView: self.view)
        self.view.layer.addSublayer(newBall.shapeLayer)
        balls.append(newBall)
    }
    
    @IBAction func clearScreen(sender : AnyObject) {
        for ball in balls {
            ball.remove()
        }
        
        balls.removeAll(keepCapacity: false)
    }
    
    func step() {
        for ball in balls {
            ball.move()
        }
    }
}

