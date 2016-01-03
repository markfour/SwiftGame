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
  
  // MARK: -
  
  func configCell(cell: BuildingTableViewCell, indexPath: NSIndexPath) -> BuildingTableViewCell {
    let dict = buildingMenu[indexPath.row]
    
    cell.titleLabel.text = dict["name"] as? String
    cell.costLabel.text = (dict["cost"] as? String)!
    cell.countLabel.text = (dict["count"] as? String)!
    
    // TODO: Get to Plist
    switch indexPath.row {
    case 0:
      cell.backgroundColor = UIColor.hexColor("41A85F")
      break
    case 1:
      cell.backgroundColor = UIColor.hexColor("F37934")
      break
    case 3:
      cell.backgroundColor = UIColor.hexColor("D14841")
      break
    case 4:
      cell.backgroundColor = UIColor.hexColor("2969B0")
      break
    default:
      break
    }
    
    return cell
  }
}

