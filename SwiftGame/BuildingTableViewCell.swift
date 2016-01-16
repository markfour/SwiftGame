//
//  BuildingTableViewCell.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/11/08.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import UIKit

class BuildingTableViewCell: UITableViewCell {
  let icon = UIImageView()
  let titleLabel = UILabel()
  let costLabel = UILabel()
  let countLabel = UILabel()
  let buyButton = UIButton()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    titleLabel.textColor = UIColor.hexColor("2c3e50")
    addSubview(titleLabel)
    
    costLabel.textColor = UIColor.hexColor("2c3e50")
    costLabel.font = UIFont(name: costLabel.font.fontName, size: 12)
    addSubview(costLabel)

    countLabel.textColor = UIColor.hexColor("2c3e50")
    countLabel.font = UIFont(name: countLabel.font.fontName, size: 12)
    addSubview(countLabel)
    
    buyButton.setTitle("建築", forState: .Normal)
    buyButton.setTitleColor(UIColor.hexColor("3498db"), forState: .Normal)
    buyButton.setTitleColor(UIColor.hexColor("2980b9"), forState: .Highlighted)
    addSubview(buyButton)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func setLayout() {
    // 右側から
    let margin: CGFloat = 8.0
    var w: CGFloat = frame.width - margin

    buyButton.frame = CGRectMake(w - 80, 0, 60, 60)
    w -= buyButton.frame.width

    costLabel.frame = CGRectMake(w - margin - 60, 0, 60, 30)
    countLabel.frame = CGRectMake(w - margin - 60, 30, 60, 30)
    w -= costLabel.frame.width

    titleLabel.frame = CGRectMake(margin, 0, frame.width - w, 60)
    w -= titleLabel.frame.width
  }
}

