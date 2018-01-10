//
//  HandWriteView.swift
//  SwipeTableViewDemo
//
//  Created by LittleTwo on 2018/01/10.
//  Copyright © 2018年 LittleTwo. All rights reserved.
//

import UIKit

class HandWriteView: UIView {

    var path:UIBezierPath? = UIBezierPath()
    var touchPoints:[CGPoint]? = []

    override func awakeFromNib() {
        
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if self.point(inside: point, with: event) {
            let view = super.hitTest(point, with: event)
            return view
        }
        return nil
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if self.bounds.contains(point) {
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let startPoint = touches.first?.location(in: self)
        path?.move(to: startPoint!)
        print("Hand Write Began!")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touchPoints?.removeAll()
        print("Hand Write Cancel!")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touchPoints?.removeAll()
        print("Hand Write Ended!")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let point = touches.first?.location(in: self)
        
        print("Hand Write Moved:\(String(describing: point))")
        if (touchPoints?.count)! < 3 {
            touchPoints?.append(point!)
        }else{
            path?.addCurve(to: touchPoints![2], controlPoint1: touchPoints![0], controlPoint2: touchPoints![1])
            touchPoints?.removeAll()
            self.setNeedsDisplay()
        }
        
    }
    
    
    func getImageFromHandWrite() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        self.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return image
    }
    
    override func draw(_ rect: CGRect) {
        
        UIColor.black.setStroke()
        path?.stroke()
    }

}
