//
//  ViewController.swift
//  SwiftGame
//
//  Created by HayashidaKazumi on 2015/10/21.
//  Copyright © 2015年 HayashidaKazumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        view.frame = CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen().bounds), CGRectGetWidth(UIScreen.mainScreen().bounds))
        
        print("window \(UIScreen.mainScreen().bounds.size)")
        print("viewDidLoad \(scrollView.frame)")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("will apper \(scrollView.frame)")

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("will apper \(scrollView.frame)")
        
        scrollView.fixImage(imageView: imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

