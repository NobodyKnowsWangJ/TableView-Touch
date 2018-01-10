//
//  ViewController.swift
//  SwipeTableViewDemo
//
//  Created by LittleTwo on 2017/10/18.
//  Copyright © 2017年 LittleTwo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var swipeTable: SwipeTableView!
    var currentMark:String!
    var dataSource:[cellDataModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMark = "MA"
        
        dataSource = []
        
        for i in 0...20 {
            
            let model = cellDataModel()
            model.title = "Cell:\(i)"
            model.mark = ""
            dataSource.append(model)
            
        }
        
        weak var weakSelf = self
        //Table View Swipe Event
        swipeTable.swipeHandler = {
            (indexpath)in
            
            let model:cellDataModel = weakSelf!.dataSource[indexpath.row]
            model.mark = weakSelf?.currentMark
            weakSelf?.dataSource[indexpath.row] = model
            //reloadRows will make cell jump
//            weakSelf?.swipeTable.reloadRows(at: [indexpath], with: .none)
            print("Reload Swipe Table")
            weakSelf?.swipeTable.reloadData()
            
        }
        
        swipeTable.register(UINib(nibName: "SwipeTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let rect = swipeTable.rectForRow(at: IndexPath(item: 1, section: 0))
        print("Rect:\(rect.origin.x,rect.origin.y,rect.size.width,rect.size.height)")
        
    }
    
    
    //MARK: - UITableViewDelegate & UITableViewDatasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:SwipeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? SwipeTableViewCell
        
        if cell==nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CustomCell") as? SwipeTableViewCell
        }
        
        let model:cellDataModel = dataSource[indexPath.row]
        cell?.titleLabel.text = model.title
        cell?.martLabel.text = model.mark
        
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //Segment Value Change Event
    @IBAction func valueChangeAction(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            currentMark = "MA"
        case 1:
            currentMark = "MB"
        case 2:
            currentMark = ""
        default:
            currentMark = "MA"
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class cellDataModel: NSObject {
    
    var title:String!
    var mark:String!
    
}



