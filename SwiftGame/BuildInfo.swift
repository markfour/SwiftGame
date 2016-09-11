//
//  BuildInfo.swift
//  SwiftGame
//
//  Created by kazumi hayashida on 2016/09/11.
//  Copyright © 2016年 HayashidaKazumi. All rights reserved.
//

import Foundation

class BuildInfo {
  // TODO 初期化方法をgetに切り替える
  var name = ""
  var count = 0
  var cost = 0
  
  init (dict :Dictionary<String, AnyObject>) {
    name = dict["name"] as! String
    cost = Int(dict["cost"] as! String)!
    count = Int(dict["count"] as! String)!
  }
}
