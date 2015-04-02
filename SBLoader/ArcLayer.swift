//
//  ArcLayer.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-20.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class ArcLayer: CAShapeLayer {
    
    let animationDuration: CFTimeInterval = 0.18
   
    override init!() {
        super.init()
        fillColor = Colors.blue.CGColor
        path = arcPathStarting().CGPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func arcPathPre() -> UIBezierPath {
        var arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 99.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 99.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    func arcPathStarting() -> UIBezierPath {
        var arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 80.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 80.0), controlPoint1: CGPoint(x: 30.0, y: 70.0), controlPoint2: CGPoint(x: 40.0, y: 90.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    func arcPathLow() -> UIBezierPath {
        var arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 60.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 60.0), controlPoint1: CGPoint(x: 30.0, y: 65.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    func arcPathMid() -> UIBezierPath {
        var arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 40.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 40.0), controlPoint1: CGPoint(x: 30.0, y: 30.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    func arcPathHigh() -> UIBezierPath {
        var arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 20.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 20.0), controlPoint1: CGPoint(x: 30.0, y: 25.0), controlPoint2: CGPoint(x: 40.0, y: 10.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    func arcPathComplete() -> UIBezierPath {
        var arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: -5.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: -5.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    func animate() {
        
        var arcAnimationPre: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationPre.fromValue = arcPathPre().CGPath
        arcAnimationPre.toValue = arcPathStarting().CGPath
        arcAnimationPre.beginTime = 0.0
        arcAnimationPre.duration = animationDuration
        
        var arcAnimationLow: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationLow.fromValue = arcPathStarting().CGPath
        arcAnimationLow.toValue = arcPathLow().CGPath
        arcAnimationLow.beginTime = arcAnimationPre.beginTime + arcAnimationPre.duration
        arcAnimationLow.duration = animationDuration
        
        var arcAnimationMid: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationMid.fromValue = arcPathLow().CGPath
        arcAnimationMid.toValue = arcPathMid().CGPath
        arcAnimationMid.beginTime = arcAnimationLow.beginTime + arcAnimationLow.duration
        arcAnimationMid.duration = animationDuration
        
        var arcAnimationHigh: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationHigh.fromValue = arcPathMid().CGPath
        arcAnimationHigh.toValue = arcPathHigh().CGPath
        arcAnimationHigh.beginTime = arcAnimationMid.beginTime + arcAnimationMid.duration
        arcAnimationHigh.duration = animationDuration
        
        var arcAnimationComplete: CABasicAnimation = CABasicAnimation(keyPath: "path")
        arcAnimationComplete.fromValue = arcPathHigh().CGPath
        arcAnimationComplete.toValue = arcPathComplete().CGPath
        arcAnimationComplete.beginTime = arcAnimationHigh.beginTime + arcAnimationHigh.duration
        arcAnimationComplete.duration = animationDuration
        
        var arcAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        arcAnimationGroup.animations = [arcAnimationPre, arcAnimationLow, arcAnimationMid, arcAnimationHigh, arcAnimationComplete]
        arcAnimationGroup.duration = arcAnimationComplete.beginTime + arcAnimationComplete.duration
        arcAnimationGroup.fillMode = kCAFillModeForwards
        arcAnimationGroup.removedOnCompletion = false
        addAnimation(arcAnimationGroup, forKey: nil)
    }
}
