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
  
  var buildInfomations: [BuildInfo] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    buildInfomations = DataManager.getBuildInfo()
    buildingsTableView.registerClass(BuildingTableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    refreshData()
  }
  
  // MARK: -
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return buildInfomations.count
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
    let info = buildInfomations[indexPath.row]
    
    cell.titleLabel.text = info.displayName
    cell.costLabel.text = String(info.cost)
    cell.countLabel.text = String(info.count)
    cell.buyButton.addTarget(self, action: "onTapBuild:", forControlEvents: .TouchUpInside)
    cell.buyButton.tag = indexPath.row
    cell.setLayout()
    
    return cell
  }
  
  // MARK: -
  func refreshData() {
    moneyLabel.text = "👪 \(DataManager.getPeople()) 🍞 \(DataManager.getFood()) 🌳 \(DataManager.getWood()) ⛏ \(DataManager.getStone())"
  }
  
  // MARK: button
  @IBAction func onResetTap(sender: AnyObject) {
    DataManager.saveInit()
    buildInfomations = DataManager.getBuildInfo()

    buildingsTableView.reloadData()
    refreshData()
  }
  
  @IBAction func onNextDayTap(sender: AnyObject) {
    DataManager.addPeople(1)
    DataManager.addWood(1)
    DataManager.addStone(1)
    
    refreshData()
  }

  func onTapBuild(selector :UIButton) {
    let info = buildInfomations[selector.tag]
    if info.cost <= DataManager.getWood() {
      DataManager.addWood(-info.count)
      
      buildInfomations[selector.tag] = info

      refreshData()
      
      let indexPath = NSIndexPath(forRow: selector.tag, inSection: 0)
      buildingsTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)

    } else {
      // TODO cannot buy
    }
  }
}

