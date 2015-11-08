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
    let path = NSBundle.mainBundle().pathForResource("BuildingMenu.plist", ofType:nil )
    let building = NSArray(contentsOfFile: path!)! as Array
    ud.setObject(building, forKey: "building")
    
    ud.setBool(true, forKey: "init")
  }
  
  static func getBuilding() -> Array<Dictionary<String, AnyObject>> {
    let array: Array = ud.objectForKey("building") as! [Dictionary<String, AnyObject>]
    return array
  }
  
  static func saveBuilding(building: Array<AnyObject>) {
    ud.setObject(building, forKey: "building")
  }
}