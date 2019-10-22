//
//  DemoView.swift
//  BezierPath
//
//  Created by shiga on 19/10/19.
//  Copyright © 2019 Shigas. All rights reserved.
//

import UIKit

class DemoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //twoShapes()
        complexShape()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    func degToRad(_ number: Double) -> Double {
        return number * .pi/180
    }
    
    func complexShape()  {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width/2 - 50, y: 0.0))
        path.addArc(withCenter: CGPoint(x: self.frame.size.width/2 - 25.0, y: 0.0), radius: 25.0, startAngle: CGFloat(degToRad(180.0)), endAngle: CGFloat(degToRad(0.0)), clockwise: false)
        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width - 50, y: 0.0))
        path.addCurve(to: CGPoint(x: self.frame.size.width, y: 50.0), controlPoint1: CGPoint(x: self.frame.size.width + 50, y: 25.0), controlPoint2: CGPoint(x: self.frame.size.width - 150, y: 50.0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.orange.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.path = path.cgPath
        
//        self.layer.addSublayer(shapeLayer)
        self.layer.mask = shapeLayer
    }
    
    func twoShapes()  {
        
        let width:CGFloat  = self.frame.size.width/2
        let height:CGFloat = self.frame.size.height/2
        
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: width/2, y: 0.0))
        path1.addLine(to: CGPoint(x: 0.0, y: height))
        path1.addLine(to: CGPoint(x:width, y: height))
        path1.close()
        
        let shapLayer1 = CAShapeLayer()
        shapLayer1.path = path1.cgPath
        shapLayer1.fillColor = UIColor.red.cgColor
        shapLayer1.strokeColor = UIColor.orange.cgColor
       // shapLayer1.position = CGPoint(x: width/2, y: 0.0)
        
        shapLayer1.bounds.origin = CGPoint(x: -20.0, y: 0.0)
        shapLayer1.bounds.size = CGSize(width: 200.0, height: 150.0)
        shapLayer1.backgroundColor = UIColor.magenta.cgColor
        
        self.layer.addSublayer(shapLayer1)
        
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0.0, y: 0.0))
        path2.addLine(to: CGPoint(x: width/2, y: height))
        path2.addLine(to: CGPoint(x: width, y: 0.0))
        path2.close()
        
        
        let shapLayer2 = CAShapeLayer()
        shapLayer2.fillColor = UIColor.green.cgColor
        shapLayer2.strokeColor = UIColor.yellow.cgColor
        shapLayer2.path = path2.cgPath
        shapLayer2.position = CGPoint(x: width/2, y: height)
        
        self.layer.addSublayer(shapLayer2)
        
    }

}
