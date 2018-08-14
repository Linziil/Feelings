//
//  Emoji.swift
//  Feelings
//
//  Created by Cake on 8/10/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import Foundation

class Emoji {
    var symbol: String
    var name: String
    var writing: String
    var time: String
    
    init(symbol: String, name: String, writing: String,
              time: String) {
        self.symbol = symbol
        self.name = name
        self.writing = writing
        self.time = time
    }
}
