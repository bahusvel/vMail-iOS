//
//  CircleBarStyleKit.swift
//  vMail
//
//  Created by Denis Lavrov on 8/03/16.
//  Copyright (c) 2016 bahus. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class CircleBarStyleKit : NSObject {

    //// Drawing Methods

    public class func drawBar(frame frame: CGRect = CGRectMake(0, 0, 693, 101)) {
        //// Color Declarations
        let gradientColor = UIColor(red: 0.929, green: 0.928, blue: 0.928, alpha: 1.000)
        let stroke = UIColor(red: 0.479, green: 0.479, blue: 0.479, alpha: 1.000)


        //// Subframes
        let frame2 = CGRectMake(frame.minX + floor((frame.width - 116) * 0.50087 + 0.5), frame.minY + floor((frame.height - 50) * 0.00000 + 0.5), 116, 50)


        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(frame2.minX + 106.5, frame2.minY + 40.5))
        bezierPath.addLineToPoint(CGPointMake(frame.maxX - 0.5, frame.minY + 40.5))
        bezierPath.addLineToPoint(CGPointMake(frame.maxX - 0.5, frame.maxY - 0.5))
        bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.00072 * frame.width, frame.maxY - 0.5))
        bezierPath.addLineToPoint(CGPointMake(frame.minX + 0.00072 * frame.width, frame.minY + 40.5))
        bezierPath.addLineToPoint(CGPointMake(frame2.minX + 8.5, frame2.minY + 40.5))
        bezierPath.addCurveToPoint(CGPointMake(frame2.minX + 8.94, frame2.minY + 38.54), controlPoint1: CGPointMake(frame2.minX + 8.63, frame2.minY + 39.84), controlPoint2: CGPointMake(frame2.minX + 8.78, frame2.minY + 39.19))
        bezierPath.addCurveToPoint(CGPointMake(frame2.minX + 57.5, frame2.minY + 0.5), controlPoint1: CGPointMake(frame2.minX + 14.3, frame2.minY + 16.7), controlPoint2: CGPointMake(frame2.minX + 34.01, frame2.minY + 0.5))
        bezierPath.addCurveToPoint(CGPointMake(frame2.minX + 106.5, frame2.minY + 40.5), controlPoint1: CGPointMake(frame2.minX + 81.69, frame2.minY + 0.5), controlPoint2: CGPointMake(frame2.minX + 101.87, frame2.minY + 17.68))
        bezierPath.closePath()
        gradientColor.setFill()
        bezierPath.fill()
        stroke.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
    }

    public class func drawButton(frame frame: CGRect = CGRectMake(0.5, 0.5, 80, 80)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let gradientColor = UIColor(red: 0.929, green: 0.928, blue: 0.928, alpha: 1.000)
        let gradientColor2 = UIColor(red: 0.868, green: 0.868, blue: 0.868, alpha: 1.000)
        let stroke = UIColor(red: 0.479, green: 0.479, blue: 0.479, alpha: 1.000)
        let fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)

        //// Gradient Declarations
        let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [gradientColor.CGColor, gradientColor2.CGColor], [0, 1])!

        //// Shadow Declarations
        let highShadow = NSShadow()
        highShadow.shadowColor = UIColor.blackColor()
        highShadow.shadowOffset = CGSizeMake(0.1, -0.1)
        highShadow.shadowBlurRadius = 5


        //// Subframes
        let group: CGRect = CGRectMake(frame.minX, frame.minY, frame.width, frame.height)


        //// Group
        CGContextSaveGState(context)
        CGContextBeginTransparencyLayer(context, nil)


        //// Oval Drawing
        let ovalRect = CGRectMake(group.minX + floor(group.width * 0.00000 + 0.5), group.minY + floor(group.height * 0.00000 + 0.5), floor(group.width * 1.00000 + 0.5) - floor(group.width * 0.00000 + 0.5), floor(group.height * 1.00000 + 0.5) - floor(group.height * 0.00000 + 0.5))
        let ovalPath = UIBezierPath(ovalInRect: ovalRect)
        CGContextSaveGState(context)
        ovalPath.addClip()
        let ovalResizeRatio: CGFloat = min(ovalRect.width / 80, ovalRect.height / 80)
        CGContextDrawRadialGradient(context, gradient,
            CGPointMake(ovalRect.midX + 0 * ovalResizeRatio, ovalRect.midY + 0 * ovalResizeRatio), 7.72 * ovalResizeRatio,
            CGPointMake(ovalRect.midX + 0 * ovalResizeRatio, ovalRect.midY + 0 * ovalResizeRatio), 39.65 * ovalResizeRatio,
            [CGGradientDrawingOptions.DrawsBeforeStartLocation, CGGradientDrawingOptions.DrawsAfterEndLocation])
        CGContextRestoreGState(context)
        stroke.setStroke()
        ovalPath.lineWidth = 1
        ovalPath.stroke()


        //// Group 2
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, highShadow.shadowOffset, highShadow.shadowBlurRadius, (highShadow.shadowColor as! UIColor).CGColor)
        CGContextSetAlpha(context, 0.4)
        CGContextSetBlendMode(context, .Darken)
        CGContextBeginTransparencyLayer(context, nil)


        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(group.minX + 0.61611 * group.width, group.minY + 0.48075 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.59913 * group.width, group.minY + 0.55643 * group.height), controlPoint1: CGPointMake(group.minX + 0.61611 * group.width, group.minY + 0.50800 * group.height), controlPoint2: CGPointMake(group.minX + 0.61328 * group.width, group.minY + 0.53222 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.51138 * group.width, group.minY + 0.61092 * group.height), controlPoint1: CGPointMake(group.minX + 0.57931 * group.width, group.minY + 0.58973 * group.height), controlPoint2: CGPointMake(group.minX + 0.55101 * group.width, group.minY + 0.60790 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.39249 * group.width, group.minY + 0.51405 * group.height), controlPoint1: CGPointMake(group.minX + 0.45477 * group.width, group.minY + 0.61698 * group.height), controlPoint2: CGPointMake(group.minX + 0.40381 * group.width, group.minY + 0.57460 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.38966 * group.width, group.minY + 0.48681 * group.height), controlPoint1: CGPointMake(group.minX + 0.38966 * group.width, group.minY + 0.50497 * group.height), controlPoint2: CGPointMake(group.minX + 0.38966 * group.width, group.minY + 0.49589 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.38966 * group.width, group.minY + 0.28701 * group.height), controlPoint1: CGPointMake(group.minX + 0.38966 * group.width, group.minY + 0.42021 * group.height), controlPoint2: CGPointMake(group.minX + 0.38966 * group.width, group.minY + 0.35361 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.46043 * group.width, group.minY + 0.18105 * group.height), controlPoint1: CGPointMake(group.minX + 0.38966 * group.width, group.minY + 0.24160 * group.height), controlPoint2: CGPointMake(group.minX + 0.42080 * group.width, group.minY + 0.19619 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.49439 * group.width, group.minY + 0.17500 * group.height), controlPoint1: CGPointMake(group.minX + 0.47175 * group.width, group.minY + 0.17803 * group.height), controlPoint2: CGPointMake(group.minX + 0.48307 * group.width, group.minY + 0.17500 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.51138 * group.width, group.minY + 0.17500 * group.height), controlPoint1: CGPointMake(group.minX + 0.50006 * group.width, group.minY + 0.17500 * group.height), controlPoint2: CGPointMake(group.minX + 0.50572 * group.width, group.minY + 0.17500 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.52836 * group.width, group.minY + 0.17803 * group.height), controlPoint1: CGPointMake(group.minX + 0.51704 * group.width, group.minY + 0.17500 * group.height), controlPoint2: CGPointMake(group.minX + 0.52270 * group.width, group.minY + 0.17500 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.61328 * group.width, group.minY + 0.28095 * group.height), controlPoint1: CGPointMake(group.minX + 0.57648 * group.width, group.minY + 0.19014 * group.height), controlPoint2: CGPointMake(group.minX + 0.60762 * group.width, group.minY + 0.22949 * group.height))
        bezierPath.moveToPoint(CGPointMake(group.minX + 0.56516 * group.width, group.minY + 0.27187 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.50289 * group.width, group.minY + 0.22041 * group.height), controlPoint1: CGPointMake(group.minX + 0.56233 * group.width, group.minY + 0.24463 * group.height), controlPoint2: CGPointMake(group.minX + 0.52836 * group.width, group.minY + 0.22041 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.44061 * group.width, group.minY + 0.26884 * group.height), controlPoint1: CGPointMake(group.minX + 0.47458 * group.width, group.minY + 0.22041 * group.height), controlPoint2: CGPointMake(group.minX + 0.44344 * group.width, group.minY + 0.24463 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.26884 * group.height), controlPoint1: CGPointMake(group.minX + 0.44627 * group.width, group.minY + 0.26884 * group.height), controlPoint2: CGPointMake(group.minX + 0.45193 * group.width, group.minY + 0.26884 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.47175 * group.width, group.minY + 0.27490 * group.height), controlPoint1: CGPointMake(group.minX + 0.46326 * group.width, group.minY + 0.26884 * group.height), controlPoint2: CGPointMake(group.minX + 0.46609 * group.width, group.minY + 0.27187 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.48024 * group.width, group.minY + 0.30214 * group.height), controlPoint1: CGPointMake(group.minX + 0.48024 * group.width, group.minY + 0.28095 * group.height), controlPoint2: CGPointMake(group.minX + 0.48307 * group.width, group.minY + 0.29306 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.31728 * group.height), controlPoint1: CGPointMake(group.minX + 0.47458 * group.width, group.minY + 0.31123 * group.height), controlPoint2: CGPointMake(group.minX + 0.46892 * group.width, group.minY + 0.31728 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.43495 * group.width, group.minY + 0.31728 * group.height), controlPoint1: CGPointMake(group.minX + 0.44910 * group.width, group.minY + 0.31728 * group.height), controlPoint2: CGPointMake(group.minX + 0.44344 * group.width, group.minY + 0.31728 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.43495 * group.width, group.minY + 0.34150 * group.height), controlPoint1: CGPointMake(group.minX + 0.43495 * group.width, group.minY + 0.32636 * group.height), controlPoint2: CGPointMake(group.minX + 0.43495 * group.width, group.minY + 0.33242 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.34150 * group.height), controlPoint1: CGPointMake(group.minX + 0.44344 * group.width, group.minY + 0.34150 * group.height), controlPoint2: CGPointMake(group.minX + 0.44910 * group.width, group.minY + 0.34150 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.47741 * group.width, group.minY + 0.35664 * group.height), controlPoint1: CGPointMake(group.minX + 0.46609 * group.width, group.minY + 0.34150 * group.height), controlPoint2: CGPointMake(group.minX + 0.47458 * group.width, group.minY + 0.34755 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.38993 * group.height), controlPoint1: CGPointMake(group.minX + 0.48307 * group.width, group.minY + 0.37177 * group.height), controlPoint2: CGPointMake(group.minX + 0.47175 * group.width, group.minY + 0.38691 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.43495 * group.width, group.minY + 0.38993 * group.height), controlPoint1: CGPointMake(group.minX + 0.44910 * group.width, group.minY + 0.38993 * group.height), controlPoint2: CGPointMake(group.minX + 0.44344 * group.width, group.minY + 0.38993 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.43495 * group.width, group.minY + 0.41415 * group.height), controlPoint1: CGPointMake(group.minX + 0.43495 * group.width, group.minY + 0.39902 * group.height), controlPoint2: CGPointMake(group.minX + 0.43495 * group.width, group.minY + 0.40507 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.57082 * group.width, group.minY + 0.41415 * group.height), controlPoint1: CGPointMake(group.minX + 0.48024 * group.width, group.minY + 0.41415 * group.height), controlPoint2: CGPointMake(group.minX + 0.52553 * group.width, group.minY + 0.41415 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.57082 * group.width, group.minY + 0.38993 * group.height), controlPoint1: CGPointMake(group.minX + 0.57082 * group.width, group.minY + 0.40507 * group.height), controlPoint2: CGPointMake(group.minX + 0.57082 * group.width, group.minY + 0.39902 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.54818 * group.width, group.minY + 0.38993 * group.height), controlPoint1: CGPointMake(group.minX + 0.56233 * group.width, group.minY + 0.38993 * group.height), controlPoint2: CGPointMake(group.minX + 0.55667 * group.width, group.minY + 0.38993 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.52836 * group.width, group.minY + 0.37783 * group.height), controlPoint1: CGPointMake(group.minX + 0.53968 * group.width, group.minY + 0.38993 * group.height), controlPoint2: CGPointMake(group.minX + 0.53119 * group.width, group.minY + 0.38691 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.54818 * group.width, group.minY + 0.34453 * group.height), controlPoint1: CGPointMake(group.minX + 0.51987 * group.width, group.minY + 0.36269 * group.height), controlPoint2: CGPointMake(group.minX + 0.53119 * group.width, group.minY + 0.34453 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.57082 * group.width, group.minY + 0.34453 * group.height), controlPoint1: CGPointMake(group.minX + 0.55667 * group.width, group.minY + 0.34453 * group.height), controlPoint2: CGPointMake(group.minX + 0.56233 * group.width, group.minY + 0.34453 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.57082 * group.width, group.minY + 0.32031 * group.height), controlPoint1: CGPointMake(group.minX + 0.57082 * group.width, group.minY + 0.33544 * group.height), controlPoint2: CGPointMake(group.minX + 0.57082 * group.width, group.minY + 0.32939 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.54818 * group.width, group.minY + 0.32031 * group.height), controlPoint1: CGPointMake(group.minX + 0.56233 * group.width, group.minY + 0.32031 * group.height), controlPoint2: CGPointMake(group.minX + 0.55667 * group.width, group.minY + 0.32031 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.52553 * group.width, group.minY + 0.29609 * group.height), controlPoint1: CGPointMake(group.minX + 0.53402 * group.width, group.minY + 0.32031 * group.height), controlPoint2: CGPointMake(group.minX + 0.52553 * group.width, group.minY + 0.30820 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.54818 * group.width, group.minY + 0.27187 * group.height), controlPoint1: CGPointMake(group.minX + 0.52553 * group.width, group.minY + 0.28398 * group.height), controlPoint2: CGPointMake(group.minX + 0.53402 * group.width, group.minY + 0.27187 * group.height))
        bezierPath.addCurveToPoint(CGPointMake(group.minX + 0.56516 * group.width, group.minY + 0.27187 * group.height), controlPoint1: CGPointMake(group.minX + 0.55384 * group.width, group.minY + 0.27187 * group.height), controlPoint2: CGPointMake(group.minX + 0.55950 * group.width, group.minY + 0.27187 * group.height))
        bezierPath.closePath()
        bezierPath.miterLimit = 4;

        fillColor.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(group.minX + 0.36702 * group.width, group.minY + 0.80467 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.36702 * group.width, group.minY + 0.78348 * group.height), controlPoint1: CGPointMake(group.minX + 0.36702 * group.width, group.minY + 0.79861 * group.height), controlPoint2: CGPointMake(group.minX + 0.36702 * group.width, group.minY + 0.78953 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.39249 * group.width, group.minY + 0.75623 * group.height), controlPoint1: CGPointMake(group.minX + 0.36702 * group.width, group.minY + 0.76531 * group.height), controlPoint2: CGPointMake(group.minX + 0.37551 * group.width, group.minY + 0.75623 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.45193 * group.width, group.minY + 0.75623 * group.height), controlPoint1: CGPointMake(group.minX + 0.41231 * group.width, group.minY + 0.75623 * group.height), controlPoint2: CGPointMake(group.minX + 0.43212 * group.width, group.minY + 0.75623 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.75018 * group.height), controlPoint1: CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.75623 * group.height), controlPoint2: CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.75320 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.70780 * group.height), controlPoint1: CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.73504 * group.height), controlPoint2: CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.72293 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.45193 * group.width, group.minY + 0.70174 * group.height), controlPoint1: CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.70477 * group.height), controlPoint2: CGPointMake(group.minX + 0.45477 * group.width, group.minY + 0.70174 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.33305 * group.width, group.minY + 0.61395 * group.height), controlPoint1: CGPointMake(group.minX + 0.40381 * group.width, group.minY + 0.68963 * group.height), controlPoint2: CGPointMake(group.minX + 0.36419 * group.width, group.minY + 0.65936 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.29625 * group.width, group.minY + 0.49286 * group.height), controlPoint1: CGPointMake(group.minX + 0.31040 * group.width, group.minY + 0.57762 * group.height), controlPoint2: CGPointMake(group.minX + 0.29625 * group.width, group.minY + 0.53524 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.29625 * group.width, group.minY + 0.46864 * group.height), controlPoint1: CGPointMake(group.minX + 0.29625 * group.width, group.minY + 0.48378 * group.height), controlPoint2: CGPointMake(group.minX + 0.29625 * group.width, group.minY + 0.47773 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.33022 * group.width, group.minY + 0.44745 * group.height), controlPoint1: CGPointMake(group.minX + 0.29625 * group.width, group.minY + 0.45048 * group.height), controlPoint2: CGPointMake(group.minX + 0.31323 * group.width, group.minY + 0.43837 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.34154 * group.width, group.minY + 0.47167 * group.height), controlPoint1: CGPointMake(group.minX + 0.33871 * group.width, group.minY + 0.45351 * group.height), controlPoint2: CGPointMake(group.minX + 0.34154 * group.width, group.minY + 0.46259 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.34437 * group.width, group.minY + 0.52616 * group.height), controlPoint1: CGPointMake(group.minX + 0.34154 * group.width, group.minY + 0.48983 * group.height), controlPoint2: CGPointMake(group.minX + 0.34154 * group.width, group.minY + 0.50800 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.65633 * group.height), controlPoint1: CGPointMake(group.minX + 0.35852 * group.width, group.minY + 0.59276 * group.height), controlPoint2: CGPointMake(group.minX + 0.39532 * group.width, group.minY + 0.63817 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.63593 * group.width, group.minY + 0.57460 * group.height), controlPoint1: CGPointMake(group.minX + 0.52836 * group.width, group.minY + 0.67752 * group.height), controlPoint2: CGPointMake(group.minX + 0.60196 * group.width, group.minY + 0.64422 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.65574 * group.width, group.minY + 0.49286 * group.height), controlPoint1: CGPointMake(group.minX + 0.65008 * group.width, group.minY + 0.55038 * group.height), controlPoint2: CGPointMake(group.minX + 0.65574 * group.width, group.minY + 0.52011 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.65574 * group.width, group.minY + 0.47167 * group.height), controlPoint1: CGPointMake(group.minX + 0.65574 * group.width, group.minY + 0.48681 * group.height), controlPoint2: CGPointMake(group.minX + 0.65574 * group.width, group.minY + 0.47773 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.66989 * group.width, group.minY + 0.44745 * group.height), controlPoint1: CGPointMake(group.minX + 0.65574 * group.width, group.minY + 0.46259 * group.height), controlPoint2: CGPointMake(group.minX + 0.66140 * group.width, group.minY + 0.45351 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.69254 * group.width, group.minY + 0.45351 * group.height), controlPoint1: CGPointMake(group.minX + 0.67838 * group.width, group.minY + 0.44443 * group.height), controlPoint2: CGPointMake(group.minX + 0.68688 * group.width, group.minY + 0.44443 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.69820 * group.width, group.minY + 0.47167 * group.height), controlPoint1: CGPointMake(group.minX + 0.69537 * group.width, group.minY + 0.45956 * group.height), controlPoint2: CGPointMake(group.minX + 0.69820 * group.width, group.minY + 0.46562 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.68405 * group.width, group.minY + 0.57762 * group.height), controlPoint1: CGPointMake(group.minX + 0.70103 * group.width, group.minY + 0.50800 * group.height), controlPoint2: CGPointMake(group.minX + 0.69820 * group.width, group.minY + 0.54130 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.62177 * group.width, group.minY + 0.66541 * group.height), controlPoint1: CGPointMake(group.minX + 0.66989 * group.width, group.minY + 0.61395 * group.height), controlPoint2: CGPointMake(group.minX + 0.65008 * group.width, group.minY + 0.64120 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.54535 * group.width, group.minY + 0.70780 * group.height), controlPoint1: CGPointMake(group.minX + 0.59913 * group.width, group.minY + 0.68661 * group.height), controlPoint2: CGPointMake(group.minX + 0.57365 * group.width, group.minY + 0.69871 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.53968 * group.width, group.minY + 0.71385 * group.height), controlPoint1: CGPointMake(group.minX + 0.54251 * group.width, group.minY + 0.70780 * group.height), controlPoint2: CGPointMake(group.minX + 0.53968 * group.width, group.minY + 0.71082 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.53968 * group.width, group.minY + 0.75926 * group.height), controlPoint1: CGPointMake(group.minX + 0.53968 * group.width, group.minY + 0.72899 * group.height), controlPoint2: CGPointMake(group.minX + 0.53968 * group.width, group.minY + 0.74412 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.54535 * group.width, group.minY + 0.76531 * group.height), controlPoint1: CGPointMake(group.minX + 0.53968 * group.width, group.minY + 0.76229 * group.height), controlPoint2: CGPointMake(group.minX + 0.54251 * group.width, group.minY + 0.76531 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.60479 * group.width, group.minY + 0.76531 * group.height), controlPoint1: CGPointMake(group.minX + 0.56516 * group.width, group.minY + 0.76531 * group.height), controlPoint2: CGPointMake(group.minX + 0.58497 * group.width, group.minY + 0.76531 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.63026 * group.width, group.minY + 0.79256 * group.height), controlPoint1: CGPointMake(group.minX + 0.62177 * group.width, group.minY + 0.76531 * group.height), controlPoint2: CGPointMake(group.minX + 0.63026 * group.width, group.minY + 0.77440 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.63026 * group.width, group.minY + 0.81375 * group.height), controlPoint1: CGPointMake(group.minX + 0.63026 * group.width, group.minY + 0.79861 * group.height), controlPoint2: CGPointMake(group.minX + 0.63026 * group.width, group.minY + 0.80770 * group.height))
        bezier2Path.addCurveToPoint(CGPointMake(group.minX + 0.36702 * group.width, group.minY + 0.80467 * group.height), controlPoint1: CGPointMake(group.minX + 0.54818 * group.width, group.minY + 0.80467 * group.height), controlPoint2: CGPointMake(group.minX + 0.45760 * group.width, group.minY + 0.80467 * group.height))
        bezier2Path.closePath()
        bezier2Path.miterLimit = 4;

        fillColor.setFill()
        bezier2Path.fill()


        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)


        CGContextEndTransparencyLayer(context)
        CGContextRestoreGState(context)
    }

    public class func drawComplete() {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Symbol Drawing
        let symbolRect = CGRectMake(0, 0, 692, 100)
        CGContextSaveGState(context)
        UIRectClip(symbolRect)
        CGContextTranslateCTM(context, symbolRect.origin.x, symbolRect.origin.y)

        CircleBarStyleKit.drawBar(frame: CGRectMake(0, 0, symbolRect.size.width, symbolRect.size.height))
        CGContextRestoreGState(context)


        //// Symbol 2 Drawing
        let symbol2Rect = CGRectMake(306, 10, 80, 80)
        CGContextSaveGState(context)
        UIRectClip(symbol2Rect)
        CGContextTranslateCTM(context, symbol2Rect.origin.x, symbol2Rect.origin.y)

        CircleBarStyleKit.drawButton(frame: CGRectMake(0, 0, symbol2Rect.size.width, symbol2Rect.size.height))
        CGContextRestoreGState(context)
    }

    public class func drawHLine(frame frame: CGRect = CGRectMake(0, 26, 351, 32)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let stroke = UIColor(red: 0.479, green: 0.479, blue: 0.479, alpha: 1.000)

        //// Shadow Declarations
        let lowShadow = NSShadow()
        lowShadow.shadowColor = UIColor.blackColor()
        lowShadow.shadowOffset = CGSizeMake(0.1, -0.1)
        lowShadow.shadowBlurRadius = 3

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(frame.minX + 2.5, frame.minY + 15.5))
        bezierPath.addLineToPoint(CGPointMake(frame.maxX - 0.5, frame.minY + 15.5))
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, lowShadow.shadowOffset, lowShadow.shadowBlurRadius, (lowShadow.shadowColor as! UIColor).CGColor)
        stroke.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        CGContextRestoreGState(context)
    }

}
