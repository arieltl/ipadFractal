//
//  ViewController.swift
//  fractalTreeIpad
//
//  Created by alessandra leventhal on 12/03/2018.
//  Copyright © 2018 ariel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var treeView: UIView!
    var initialAngle : Double!
    var initialLength : Double!
    var length : Double!
    var angle : Double!
    var maxLength : Double!
    var initialX : CGFloat!
    var initialY : CGFloat!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.treeView.backgroundColor = UIColor.lightGray
        let frame = view.frame
        let from = CGPoint(x:frame.midX + initialX ,y:frame.maxY - initialY)
        drawBranch(start: from, angle: initialAngle, isFirst: true, lastLength: initialLength, width: 3)
        
    }
    
    func drawBranch(start:CGPoint,angle:Double,isFirst:Bool,lastLength: Double, width: CGFloat) {
        
        var branchArmLength = Double()
        if isFirst{
            branchArmLength = lastLength
        } else {
            branchArmLength = lastLength * length
        }
        if branchArmLength > initialLength * maxLength{
            let x2 = Double(start.x) - ((cos(angle * Double.pi/180)) * branchArmLength)
            let y2 = Double(start.y) - ((sin(angle * Double.pi/180)) * branchArmLength)
            
            
            drawLine(from: start, to: CGPoint(x:x2, y:y2), width: width, length: branchArmLength)
            
            drawBranch(start: CGPoint(x:x2, y:y2), angle: angle - self.angle, isFirst: false, lastLength: branchArmLength, width: width * 0.75)
            
            drawBranch(start: CGPoint(x:x2, y:y2), angle: angle + self.angle, isFirst: false, lastLength: branchArmLength, width: width * 0.85)
        }
        
        
        
        
        
    }
    
    
    func drawLine(from:CGPoint,to:CGPoint,width:CGFloat,length: Double) {
        let path = UIBezierPath()
        path.move(to: from)
        path.addLine(to: to)
        path.lineCapStyle = .round
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.lineWidth = width
        var minValue : Double
        if self.length >= 0.7 {
            minValue = (initialLength * maxLength) / pow(self.length, 4)
            
        } else {
            minValue = (initialLength * maxLength) / pow(self.length, 3)
        }
        layer.strokeColor = UIColor.black.cgColor

        if length < minValue {
            print(true)
            layer.strokeColor = UIColor.green.cgColor
           
        }
        
        self.treeView.layer.addSublayer(layer)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

