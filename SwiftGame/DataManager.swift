//
//  DataManager.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/11/08.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import Foundation

struct DataManager {
  static let ud = NSUserDefaults.standardUserDefaults()
  
  static func didInit() -> Bool{
    if ud.boolForKey("init") {
      return true
    }
    return false
  }
  
  static func saveInit() {
    ud.setInteger(10, forKey: "money")
    
    guard let path = NSBundle.mainBundle().pathForResource("BuildingMenu.plist", ofType:nil) else { return }
    guard let building = NSArray(contentsOfFile: path) else { return }
    ud.setObject(building, forKey: "building")
    ud.setBool(true, forKey: "init")
  }
  
  static func getBuilding() -> Array<Dictionary<String, AnyObject>> {
    let array: Array = ud.objectForKey("building") as! [Dictionary<String, AnyObject>]
    return array
  }
  
  static func getBuildInfo() -> [BuildInfo] {
    let array: Array = ud.objectForKey("building") as! [Dictionary<String, AnyObject>]
    var buildInfomations: [BuildInfo] = []
    
    for dict:Dictionary<String, AnyObject> in array {
      let info = BuildInfo(dict: dict)
      buildInfomations.append(info)
    }
    
    return buildInfomations
  }
  
  static func saveBuilding(building: Array<AnyObject>) {
    ud.setObject(building, forKey: "building")
  }
  
  static func setBuilding(buildInfo: [BuildInfo], id: UInt) {
    
  }
  
  // TODO Int to Int64
  static func getMoney() -> Int {
    return ud.integerForKey("money")
  }
  
  static func setMoney(money: Int) {
    ud.setInteger(money, forKey: "money")
  }
  
  static func addMoney(money: Int) {
    var value = ud.integerForKey("money")
    value += money
    ud.setInteger(value, forKey: "money")
  }
}
