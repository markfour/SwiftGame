//
//  UICIolor+Hex.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/11/09.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import UIKit

extension UIColor {
  class func hexColor(_ hexStr: NSString, alpha: CGFloat) -> UIColor {
    let hex = hexStr.replacingOccurrences(of: "#", with: "")
    let scanner = Scanner(string: hex as String)
    var color: UInt32 = 0
    if scanner.scanHexInt32(&color) {
      let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
      let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
      let b = CGFloat(color & 0x0000FF) / 255.0
      return UIColor(red:r,green:g,blue:b,alpha:alpha)
    } else {
      return UIColor.white;
    }
  }
  
  class func hexColor(_ hexStr: NSString) -> UIColor {
    return hexColor(hexStr, alpha: 1)
  }
}
