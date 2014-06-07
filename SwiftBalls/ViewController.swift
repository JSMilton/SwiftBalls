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
    
    var displayLink:CADisplayLink!
    var balls = Ball[]()
                            
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
        let newBall = Ball(startPt: sender.locationInView(self.view), size: CGSize(width: 20, height: 20), velocity: CGPoint(x: 5, y: 5), pView: self.view)
        self.view.layer.addSublayer(newBall.shapeLayer)
        balls.append(newBall)
    }
    
    func step() {
        for ball in balls {
            ball.move()
        }
    }
}

