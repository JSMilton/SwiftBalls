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
    var startPoint:CGPoint
    var velocity:CGPoint
    var actingForce:CGPoint
    var boundary:CGRect
    
    init(startPt:CGPoint, size:CGSize, force:CGPoint, pView:UIView) {
        self.shapeLayer = CAShapeLayer()
        self.shapeLayer.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        self.shapeLayer.path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: 0, y: 0), size: size), cornerRadius: size.width/2).CGPath
        self.shapeLayer.position = startPt
        let red = (Float)(rand() % 100) / 100.0
        let blue = (Float)(rand() % 100) / 100.0
        let green = (Float)(rand() % 100) / 100.0
        self.shapeLayer.fillColor = UIColor(red: red, green: green, blue: blue, alpha: 1).CGColor
        self.shapeLayer.backgroundColor = UIColor.clearColor().CGColor
        self.shapeLayer.actions = ["position":NSNull()]
        self.boundary = CGRect(origin: pView.frame.origin, size: pView.frame.size)
        self.velocity = CGPoint(x: 1, y: 1)
        self.actingForce = force
        self.startPoint = startPt
    }
    
    func move() {
        if (self.shapeLayer.position.x >= self.boundary.size.width || self.shapeLayer.position.x <= self.boundary.origin.x) {
            self.velocity.x *= -1
        } else {
            self.velocity.x += self.actingForce.x
        }
        if (self.shapeLayer.position.y >= self.boundary.size.height) {
            self.velocity.y *= -1
        } else {
            self.velocity.y += self.actingForce.y
        }
        self.shapeLayer.position.x += velocity.x
        self.shapeLayer.position.y += velocity.y
    }
    
    func remove() {
        self.shapeLayer.removeFromSuperlayer()
    }
}
