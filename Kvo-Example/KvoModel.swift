//
//  KvoModel.swift
//  Kvo-Example
//
//  Created by Osamu Nishiyama on 2015/03/17.
//  Copyright (c) 2015年 EVER SENSE, INC. All rights reserved.
//

import Foundation

class KvoModel : NSObject {
    
    class var sharedInstance: KvoModel {
        struct Singleton {
            static let instance: KvoModel = KvoModel()
        }
        return Singleton.instance
    }
    
    dynamic var myDate = NSDate()
    
    func updateDate(){
        self.myDate = NSDate()
    }
    
}