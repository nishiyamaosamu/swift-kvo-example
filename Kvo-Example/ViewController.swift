//
//  ViewController.swift
//  Kvo-Example
//
//  Created by Osamu Nishiyama on 2015/03/17.
//  Copyright (c) 2015年 EVER SENSE, INC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.label.frame.size = CGSize(width: 220, height: 50)
        self.label.center = self.view.center
        self.view.addSubview(self.label)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.label.text = KvoModel.sharedInstance.myDate.description
        
        KvoModel.sharedInstance.addObserver(self, forKeyPath: "myDate", options: .New, context: nil)
    }
    
    override func viewDidDisappear(animated: Bool){
        KvoModel.sharedInstance.removeObserver(self, forKeyPath: "myDate")
    }

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)
        println("touched!")
        print("Old myDate -> ")
        println(KvoModel.sharedInstance.myDate)
        
        KvoModel.sharedInstance.updateDate()
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if(keyPath == "myDate"){
            print("New myDate -> ")
            println(KvoModel.sharedInstance.myDate)
            
            self.label.text = KvoModel.sharedInstance.myDate.description
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

