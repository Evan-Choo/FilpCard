//
//  Card.swift
//  FilpCard
//
//  Created by Evan Choo on 2019/3/7.
//  Copyright © 2019 Evan Choo. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory: Int = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1;
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
