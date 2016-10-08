//
//  UIScrollView+Image.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/11/01.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import UIKit

extension UIScrollView {
  func fixImage(imageView:UIImageView) {
    // Fit image
    var resize = frame.size
    
    let wRatio = frame.size.width / (imageView.image?.size.width)!
    let hRatio = frame.size.height / (imageView.image?.size.height)!
    
    if wRatio < hRatio {
      // height is big
      resize.width = (imageView.image?.size.width)! * hRatio
      
    } else {
      // width is big
      resize.width = (imageView.image?.size.width)! * hRatio
    }
    
    imageView.image = imageView.image?.resizeToSize(resize)
    imageView.backgroundColor = UIColor.blue
  }
}
