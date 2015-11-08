//
//  ViewController.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/10/21.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var buildingsTable: UITableView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageView: UIImageView!
  
  var buildingMenu = [Dictionary<String, AnyObject>]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    buildingMenu = DataManager.getBuilding()
    buildingsTable.registerClass(BuildingTableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    scrollView.fixImage(imageView: imageView)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: -
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return buildingMenu.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = BuildingTableViewCell.init()
    
    cell = configCell(cell, indexPath: indexPath)

    return cell
  }
  
  func configCell(cell: BuildingTableViewCell, indexPath: NSIndexPath) -> BuildingTableViewCell {
    let dict = buildingMenu[indexPath.row]
    cell.titleLabel.text = dict["name"] as? String
    return cell
  }
  
//  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCellWithIdentifier( "LabelCell", forIndexPath: indexPath)
//    
//   ... // Configure the cell
//    cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
//    
//    return cell
//  }
}

