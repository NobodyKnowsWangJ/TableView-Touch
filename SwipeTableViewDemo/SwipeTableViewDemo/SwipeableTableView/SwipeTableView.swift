//
//  SwipeTableView.swift
//  SwipeTableViewDemo
//
//  Created by LittleTwo on 2017/10/18.
//  Copyright © 2017年 LittleTwo. All rights reserved.
//

import UIKit

class SwipeTableView: UITableView {

    //Table View Swipe Event
    var swipeHandler:((IndexPath)->Void)!
    //Cell Update Status Dictionary
    var reloadStatusDictionary:Dictionary<IndexPath, String>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reloadStatusDictionary = Dictionary()
    }
    //Get Cell Touched Index
    func currentTouchIndex(point:CGPoint) -> IndexPath! {
        
        let currentVisableCells = self.indexPathsForVisibleRows
        
        for indexpath in currentVisableCells! {
            
            let cellRect = self.rectForRow(at: indexpath)
            
            if cellRect.origin.y<point.y && cellRect.origin.y+cellRect.size.height>point.y && point.x>=100 && point.x<=150{
                return indexpath
            }
        }
        return nil
    }
    //Update Cell Mark With Touch
    func updateTouchCellStatus(touchPoint:CGPoint) {
        let index = currentTouchIndex(point: touchPoint)
        if let handler = swipeHandler {
            if let myIndex = index{
                let status = reloadStatusDictionary[myIndex]
                if status==nil{
                    reloadStatusDictionary[myIndex] = "Updated"
                    handler(myIndex)
                }
            }
        }
    }
    
    //MARK: -Touch Event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchPoint = touch?.location(in: self) ?? CGPoint()
        print(touchPoint)
        
        updateTouchCellStatus(touchPoint: touchPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchPoint = touch?.location(in: self) ?? CGPoint()
        print(touchPoint)
        
        updateTouchCellStatus(touchPoint: touchPoint)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("Touch End!")
        //Enable Scroll When Touch Ended
        self.isScrollEnabled = true
        
        reloadStatusDictionary.removeAll()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch Cancelled!")
        //Enable Scroll When Touch Cancelled
        self.isScrollEnabled = true
        
        reloadStatusDictionary.removeAll()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        if point.x>=100 && point.x <= 150{
            //Donot Scroll if touch in mark area
            self.isScrollEnabled = false
            
        }
        return true
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
