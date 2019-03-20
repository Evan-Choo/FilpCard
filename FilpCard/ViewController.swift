//
//  ViewController.swift
//  FilpCard
//
//  Created by Evan Choo on 2019/3/7.
//  Copyright © 2019 Evan Choo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices: [String] = ["⭕️", "❌", "⭕️", "❌"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card no found")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button: UIButton = cardButtons[index]
            let card: Card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle("", for: UIButton.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            } else {
                button.setTitle(emoji, for: UIButton.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
}

