//
//  SwipeTableViewCell.swift
//  SwipeTableViewDemo
//
//  Created by LittleTwo on 2017/10/18.
//  Copyright © 2017年 LittleTwo. All rights reserved.
//

import UIKit

class SwipeTableViewCell: UITableViewCell {

    @IBOutlet weak var redView: UIView!
    var identifier:String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var martLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
