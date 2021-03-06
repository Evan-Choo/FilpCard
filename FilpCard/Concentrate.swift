//
//  Concentrate.swift
//  FilpCard
//
//  Created by Evan Choo on 2019/3/7.
//  Copyright © 2019 Evan Choo. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //TODO: Do the suffle work
    }
}
