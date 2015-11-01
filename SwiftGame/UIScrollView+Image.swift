//
//  UIScrollView+Image.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/11/01.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import UIKit

extension UIScrollView {
    func fixImage(imageView imageView:UIImageView) {
        // Fit image
        var resize = frame.size
        
        let wRatio = frame.size.width / (imageView.image?.size.width)!
        let hRatio = frame.size.height / (imageView.image?.size.height)!
        
        print(frame)
        print("wr \(wRatio) hr \(hRatio)")
        print("image \(imageView.image?.size)")
        
        
        if wRatio < hRatio {
            // height is big
            let ratio = resize.height / hRatio
            resize.width = (imageView.image?.size.width)! * hRatio
            
        } else {
            // width is big
            let ratio = resize.width / wRatio
            resize.width = (imageView.image?.size.width)! * hRatio
        }
        print("imageview image \(imageView.image?.size)")
        print(resize)
        
//        UIGraphicsBeginImageContext(resize)
//        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
        
        imageView.image = imageView.image?.resizeToSize(resize)

        
        imageView.backgroundColor = UIColor.blueColor()
        
//        imageView.frame = CGRectMake(0, 0, (imageView.image?.size.width)!, (imageView.image?.size.height)!)
        
        print(imageView.frame)
        print(imageView.image?.size)
    }
}
