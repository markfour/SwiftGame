//
//  BuildingTableViewCell.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/11/08.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import UIKit

class BuildingTableViewCell: UITableViewCell {
  @IBOutlet weak var icon: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var costLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = UIColor.redColor()
    
//    titleLabel.frame = CGRectMake(8, 0, 100, 60)
//    titleLabel.textColor = UIColor.hexColor("EFEFEF")
//    
//    costLabel.frame = CGRectMake(frame.width - 8 - 60, 0, 60, 30)
//    costLabel.textColor = UIColor.hexColor("EFEFEF")
//    addSubview(costLabel)
//    
//    countLabel.frame = CGRectMake(frame.width - 8 - 60, 30, 60, 30)
//    countLabel.textColor = UIColor.hexColor("EFEFEF")
//    addSubview(countLabel)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}

