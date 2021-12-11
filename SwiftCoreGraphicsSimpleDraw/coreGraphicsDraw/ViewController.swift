//
//  ViewController.swift
//  coreGraphicsDraw
//
//  Created by heo on 2021/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /// Draw Line
    @IBAction func btnDrawLine(_ sender: Any) {
        
        // config Context
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Line
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 100, y: 100))
        context.addLine(to: CGPoint(x: 220, y: 220))
        context.strokePath()
        
        // Draw Triangle
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x: 150, y: 200))
        context.addLine(to: CGPoint(x: 250, y: 350))
        context.addLine(to: CGPoint(x: 50, y: 350))
        context.addLine(to: CGPoint(x: 150, y: 200))
        context.strokePath()
        
        // Allocate Context to ImageView
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        // End
        UIGraphicsEndImageContext()
    }
    
    /// Draw Rectangle
    @IBAction func btnDrawRect(_ sender: Any) {
        // config Context
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.purple.cgColor)
        
        context.addRect(CGRect(x: 50, y: 100, width: 200, height: 200))
        context.strokePath()
        
        // Allocate Context to ImageView
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        // End
        UIGraphicsEndImageContext()
    }
    
    /// Draw Circle
    @IBAction func btnDrawCircle(_ sender: Any) {
        // config Context
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Ellipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        context.addEllipse(in: CGRect(x: 50, y: 50, width: 200, height: 100))
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.addEllipse(in: CGRect(x: 50, y: 200, width: 200, height: 200))
        context.strokePath()
        
        // Allocate Context to ImageView
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        // End
        UIGraphicsEndImageContext()
    }
    
    /// Draw Arc
    @IBAction func btnDrawArc(_ sender: Any) {
        // config Context
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Arc(1)
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 50, y: 50))
        
        context.addArc(tangent1End: CGPoint(x: 200, y: 50), tangent2End: CGPoint(x: 200, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 200, y: 200))
        
        // Draw Arc(2)
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 250, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        // Allocate Context to ImageView
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        // End
        UIGraphicsEndImageContext()
    }
    
    /// Fill Color
    @IBAction func btnDrawFill(_ sender: Any) {
        // config Context
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Rectangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)

        let rectangle = CGRect(x: 50, y: 50, width: 200, height: 100)
        context.addRect(rectangle)
        // fill Rectangle
        context.fill(rectangle)
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 50, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        // fill Ellipse
        context.fillEllipse(in: circle)
        context.strokePath()
        
        // Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 150, y: 350))
        context.addLine(to: CGPoint(x: 250, y: 450))
        context.addLine(to: CGPoint(x: 50, y: 450))
        context.addLine(to: CGPoint(x: 150, y: 350))
        // fill Triangle
        context.fillPath()
        context.strokePath()
        
        // Allocate Context to ImageView
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        // End
        UIGraphicsEndImageContext()
    }
}

