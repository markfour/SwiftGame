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
  
  // MARK: View life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    buildInfomations = DataManager.getBuildInfo()
    buildingsTableView.register(BuildingTableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    refreshData()
  }
  
  // MARK: -
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return buildInfomations.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: BuildingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BuildingTableViewCell
    cell = configCell(cell, indexPath: indexPath)
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func configCell(_ cell: BuildingTableViewCell, indexPath: IndexPath) -> BuildingTableViewCell {
    let info = buildInfomations[(indexPath as NSIndexPath).row]
    
    cell.titleLabel.text = info.name
    cell.costLabel.text = String(info.cost)
    cell.countLabel.text = String(info.count)
    cell.buyButton.addTarget(self, action: #selector(ViewController.onTapBuild(_:)), for: .touchUpInside)
    cell.buyButton.tag = (indexPath as NSIndexPath).row
    cell.setLayout()
    
    return cell
  }
  
  // MARK: -
  func refreshData() {
    moneyLabel.text = "👪 \(DataManager.getPeople()) 🍞 \(DataManager.getFood()) 🌳 \(DataManager.getWood()) ⛏ \(DataManager.getStone())"
  }
  
  // MARK: button
  @IBAction func onResetTap(_ sender: AnyObject) {
    DataManager.saveInit()
    buildInfomations = DataManager.getBuildInfo()

    buildingsTableView.reloadData()
    refreshData()
  }
  
  @IBAction func onNextDayTap(_ sender: AnyObject) {
    DataManager.addPeople(1)
    DataManager.addWood(1)
    DataManager.addStone(1)
    
    refreshData()
  }

  func onTapBuild(_ selector :UIButton) {
    let buildingIndex = selector.tag
    let info = buildInfomations[buildingIndex]
    if info.cost <= DataManager.getWood() {
      DataManager.addWood(-info.cost)
      info.count += 1
      buildInfomations[buildingIndex] = info
      DataManager.saveBuildings(buildInfomations)

      refreshData()
      
      let indexPath = IndexPath(row: selector.tag, section: 0)
      buildingsTableView.reloadRows(at: [indexPath], with: .automatic)

    } else {
      // TODO cannot buy
    }
  }
}

