//
//  ViewController.swift
//  BezierPath
//
//  Created by shiga on 19/10/19.
//  Copyright © 2019 Shigas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var upView: UIView!
    var demoView = DemoView()
    @IBOutlet weak var buttonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // createDemoView()
        
        createArcView()
        createButtonView()
    }
    
    func degToRad(_ number:Double) -> Double {
        return number * .pi / 180
    }
    
    func createArcView()  {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.upView.frame.size.width, y: 0.0))
        
        path.addArc(withCenter: CGPoint(x: self.upView.frame.size.width , y: self.upView.frame.size.height), radius: 20.0, startAngle: CGFloat(degToRad(270.0)), endAngle: CGFloat(degToRad(45.0)), clockwise: false)
        
        path.addArc(withCenter: CGPoint(x: 0.0, y: self.upView.frame.size.height), radius: 20.0, startAngle: CGFloat(degToRad(90.0)), endAngle: CGFloat(degToRad(270.0)), clockwise: false)
        path.close()
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        self.upView.layer.mask = shapeLayer
    }
    
    func createButtonView()  {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: self.buttonView.frame.size.height))
        path.addLine(to: CGPoint(x: self.buttonView.frame.size.width, y: self.buttonView.frame.size.height))
        path.addArc(withCenter: CGPoint(x: self.buttonView.frame.size.width, y: 0.0), radius: 20.0, startAngle: CGFloat(degToRad(90.0)), endAngle: CGFloat(degToRad(270.0)), clockwise: true)
        path.addArc(withCenter: CGPoint(x: 0.0, y: 0.0), radius: 20.0, startAngle: CGFloat(degToRad(270.0)), endAngle: CGFloat(degToRad(90.0)), clockwise: true)
        path.close()
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
//        shapeLayer.lineWidth = 10.0
//        shapeLayer.strokeColor = UIColor.green.cgColor
        
        self.buttonView.layer.mask = shapeLayer
        
        
        
    }
    

    func createDemoView(){
        
        let width:CGFloat = 240.0
        let height:CGFloat = 160.0
        
        demoView = DemoView(frame: CGRect(x: self.view.frame.size.width/2 - width/2, y: self.view.frame.height/2 - height/2, width: width, height: height))
               demoView.backgroundColor = .black
               self.view.addSubview(demoView)
    }

}

