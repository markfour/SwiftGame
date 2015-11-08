//
//  ViewController.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/10/21.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageView: UIImageView!
  
  var mainMenu = [Dictionary<String, AnyObject>]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let path = NSBundle.mainBundle().pathForResource("BuildingMenu.plist", ofType:nil )
    mainMenu = NSArray(contentsOfFile: path!) as! Array
    print(mainMenu.count)
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
    return mainMenu.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell.init()
    
    let menu = mainMenu[indexPath.row]
    cell.textLabel?.text = menu["name"] as? String
    
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

