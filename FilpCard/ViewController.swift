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
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices: [String] = ["⭕️", "❌", "😂", "😳"]
    
    //var emojiChoices : Dictionary<Int, String> = Dictionary<Int, String>()
    var emojiChosen = [Int : String]()
    
    func emoji(for card: Card) -> String{
        if emojiChosen[card.identifier] == nil{
            let index : Int = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiChosen[card.identifier] = emojiChoices.remove(at: index)
        }
        return emojiChosen[card.identifier] ?? "?"
    }
}

