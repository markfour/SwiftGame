//
//  DataManager.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/11/08.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import Foundation

struct Status {
  static let people = "peple"
  static let food = "food"
  static let wood = "wood"
  static let stone = "stone"
}

struct DataManager {
  static let ud = NSUserDefaults.standardUserDefaults()
  
  static func didInit() -> Bool{
    if ud.boolForKey("init") {
      return true
    }
    return false
  }
  
  static func saveInit() {
    ud.setInteger(10, forKey: Status.people)
    ud.setInteger(10, forKey: Status.food)
    ud.setInteger(10, forKey: Status.wood)
    ud.setInteger(10, forKey: Status.stone)
    
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

  // People
  static func getPeople() -> Int {
    return ud.integerForKey(Status.people)
  }
  
  static func setPeople(value: Int) {
    ud.setInteger(value, forKey: Status.people)
  }
  
  static func addPeople(value: Int) {
    var _value = ud.integerForKey(Status.people)
    _value += value
    ud.setInteger(_value, forKey: Status.people)
  }
  
  static func getFood() -> Int {
    return ud.integerForKey(Status.food)
  }
  
  // Food
  static func setFood(value: Int) {
    ud.setInteger(value, forKey: Status.food)
  }
  
  static func addFood(value: Int) {
    var _value = ud.integerForKey(Status.food)
    _value += value
    ud.setInteger(_value, forKey: Status.food)
  }
  
  // Wood
  static func getWood() -> Int {
    return ud.integerForKey(Status.wood)
  }
  
  static func setWood(value: Int) {
    ud.setInteger(value, forKey: Status.wood)
  }
  
  static func addWood(value: Int) {
    var _value = ud.integerForKey(Status.wood)
    _value += value
    ud.setInteger(_value, forKey: Status.wood)
  }
  
  // Stone
  static func getStone() -> Int {
    return ud.integerForKey(Status.stone)
  }
  
  static func setStone(value: Int) {
    ud.setInteger(value, forKey: Status.stone)
  }
  
  static func addStone(value: Int) {
    var _value = ud.integerForKey(Status.stone)
    _value += value
    ud.setInteger(_value, forKey: Status.stone)
  }
}
