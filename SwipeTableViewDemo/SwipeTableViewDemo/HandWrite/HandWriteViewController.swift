//
//  HandWriteViewController.swift
//  SwipeTableViewDemo
//
//  Created by LittleTwo on 2018/01/10.
//  Copyright © 2018年 LittleTwo. All rights reserved.
//

import UIKit

class HandWriteViewController: UIViewController {
    
    @IBOutlet weak var writeView: HandWriteView!
    
    @IBOutlet weak var showImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func getWriteResult(_ sender: UIButton) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
