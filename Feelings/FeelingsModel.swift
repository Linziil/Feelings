//
//  emojiModel.swift
//  Feelings
//
//  Created by Cake on 8/5/18.
//  Copyright © 2018 Cake. All rights reserved.
////
//
import UIKit
import Foundation
class FeelingsModel: NSObject {
    var id : Int?
    var symbol : String?
    var name : String?
    var writing : String?
    var time : String?
    var PassingDate : String?
    
    override init ()
    {}
    
    init(symbol : String, name : String, writing : String, time : String, date : String, PassingDate : String){
        self.symbol = symbol
        self.name = name
        self.writing = writing
        self.time = time     
    }
    
    
  
    override var description: String {
        return "Symbol: \(symbol), Name: \(name), writing: \(writing), time: \(time), PassingDate : \(PassingDate)"
        
    }
}


