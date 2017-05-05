//
//  DataManager.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/11/08.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import Foundation

struct Status {
  static let people = "people"
  static let food = "food"
  static let wood = "wood"
  static let stone = "stone"
}

struct DataManager {
  static let ud = UserDefaults.standard
  
  static func didInit() -> Bool{
    if ud.bool(forKey: "init") {
      return true
    }
    return false
  }
  
  static func saveInit() {
    ud.set(10, forKey: Status.people)
    ud.set(10, forKey: Status.food)
    ud.set(10, forKey: Status.wood)
    ud.set(10, forKey: Status.stone)
    
    guard let path = Bundle.main.path(forResource: "BuildingMenu.plist", ofType:nil) else { return }
    guard let building = NSArray(contentsOfFile: path) else { return }
    ud.set(building, forKey: "building")
    ud.set(true, forKey: "init")
  }
  
  static func getBuilding() -> Array<Dictionary<String, AnyObject>> {
    let array: Array = ud.object(forKey: "building") as! [Dictionary<String, AnyObject>]
    return array
  }
  
  static func getBuildInfo() -> [BuildInfo] {
    let array: Array = ud.object(forKey: "building") as! [Dictionary<String, AnyObject>]
    var buildInfomations: [BuildInfo] = []
    
    for dict:Dictionary<String, AnyObject> in array {
      let info = BuildInfo(dict: dict)
      buildInfomations.append(info)
    }
    
    return buildInfomations
  }
  
  static func saveBuildings(_ buildings: [BuildInfo]) {
    var saveBuildings: [Dictionary<String, String>] = []
    for building in buildings {
      let saveBuild = ["name": building.name,
                       "cost": String(building.cost),
                       "count": String(building.count)]
      saveBuildings.append(saveBuild)
    }
    ud.set(saveBuildings, forKey: "building")
  }
  
  static func setBuilding(_ buildInfo: [BuildInfo], id: UInt) {
    
  }
  
  // TODO Int to Int64
  
  // People
  static func getPeople() -> Int {
    return ud.integer(forKey: Status.people)
  }
  
  static func setPeople(_ value: Int) {
    ud.set(value, forKey: Status.people)
  }
  
  static func addPeople(_ value: Int) {
    var _value = ud.integer(forKey: Status.people)
    _value += value
    ud.set(_value, forKey: Status.people)
  }
  
  static func getFood() -> Int {
    return ud.integer(forKey: Status.food)
  }
  
  // Food
  static func setFood(_ value: Int) {
    ud.set(value, forKey: Status.food)
  }
  
  static func addFood(_ value: Int) {
    var _value = ud.integer(forKey: Status.food)
    _value += value
    ud.set(_value, forKey: Status.food)
  }
  
  // Wood
  static func getWood() -> Int {
    return ud.integer(forKey: Status.wood)
  }
  
  static func setWood(_ value: Int) {
    ud.set(value, forKey: Status.wood)
  }
  
  static func addWood(_ value: Int) {
    var _value = ud.integer(forKey: Status.wood)
    _value += value
    ud.set(_value, forKey: Status.wood)
  }
  
  // Stone
  static func getStone() -> Int {
    return ud.integer(forKey: Status.stone)
  }
  
  static func setStone(_ value: Int) {
    ud.set(value, forKey: Status.stone)
  }
  
  static func addStone(_ value: Int) {
    var _value = ud.integer(forKey: Status.stone)
    _value += value
    ud.set(_value, forKey: Status.stone)
  }
}
