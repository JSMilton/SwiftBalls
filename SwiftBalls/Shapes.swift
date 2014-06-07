//
//  Shapes.swift
//  SwiftBalls
//
//  Created by James Milton on 07/06/2014.
//  Copyright (c) 2014 James Milton. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit

class Ball {
    let shapeLayer: CAShapeLayer
    var velocity:CGPoint
    var boundary:CGRect
    
    init(startPt:CGPoint, size:CGSize, velocity:CGPoint, pView:UIView) {
        self.shapeLayer = CAShapeLayer()
        self.shapeLayer.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        self.shapeLayer.path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: 0, y: 0), size: size), cornerRadius: size.width/2).CGPath
        self.shapeLayer.position = startPt
        self.shapeLayer.fillColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).CGColor
        self.shapeLayer.backgroundColor = UIColor.clearColor().CGColor
        self.shapeLayer.actions = ["position":NSNull()]
        self.boundary = CGRect(origin: pView.frame.origin, size: pView.frame.size)
        self.velocity = velocity
    }
    
    func move() {
        self.shapeLayer.position.x += velocity.x
        self.shapeLayer.position.y += velocity.y
        if (self.shapeLayer.position.x > self.boundary.size.width || self.shapeLayer.position.x < self.boundary.origin.x) {
            self.velocity.x *= -1
        }
        if (self.shapeLayer.position.y > self.boundary.size.height || self.shapeLayer.position.y < self.boundary.origin.y) {
            self.velocity.y *= -1
        }
    }
    
    func remove() {
        self.shapeLayer.removeFromSuperlayer()
    }
}
