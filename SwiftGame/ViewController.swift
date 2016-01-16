//
//  ViewController.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/10/21.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var buildingsTableView: UITableView!
  @IBOutlet weak var moneyLabel: UILabel!
  
  var buildingMenu = [Dictionary<String, AnyObject>]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    buildingMenu = DataManager.getBuilding()
    buildingsTableView.registerClass(BuildingTableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    refreshMoney()
  }
  
  // MARK: -
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return buildingMenu.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell: BuildingTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BuildingTableViewCell
    cell = configCell(cell, indexPath: indexPath)
    return cell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  func configCell(cell: BuildingTableViewCell, indexPath: NSIndexPath) -> BuildingTableViewCell {
    let dict: Dictionary = buildingMenu[indexPath.row]
    
    cell.titleLabel.text = dict["name"] as? String
    if let cost = dict["cost"] as? String {
      cell.costLabel.text = "💰 \(cost)"
    }
    if let count = dict["count"] as? String {
      cell.countLabel.text = "🏛 \(count)"
    }
    cell.buyButton.addTarget(self, action: "onTapBuild:", forControlEvents: .TouchUpInside)
    cell.buyButton.tag = indexPath.row
    cell.setLayout()
    
    return cell
  }
  
  // MARK: -
  func refreshMoney() {
    moneyLabel.text = "💰 \(DataManager.getMoney())"
  }
  
  // MARK: button
  
  func onTapBuild(selector :UIButton) {
    // TODO MakeBuildinfo
    let dict: Dictionary = buildingMenu[selector.tag]
    let buildInfo = BuildInfo.init(dict: dict)
    var money = DataManager.getMoney()
    if buildInfo.cost <= money {
      money -= buildInfo.cost
      buildInfo.count++
      
      DataManager.setMoney(money)
      buildingMenu[selector.tag] = dict
      DataManager.saveBuilding(buildingMenu)
      
      refreshMoney()
      
      let indexPath = NSIndexPath(forRow: selector.tag, inSection: 0)
      var cell: BuildingTableViewCell = buildingsTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BuildingTableViewCell
      cell = configCell(cell, indexPath: indexPath)
      
    } else {
      // TODO cannot buy
    }
  }
}

