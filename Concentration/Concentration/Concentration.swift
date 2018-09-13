//
//  Concentration.swift
//  Concentration
//
//  Created by 黄之信 on 2018/9/12.
//  Copyright © 2018年 MichaelHuang. All rights reserved.
//

import Foundation

class Concentration {
    var cards =  [Card]() // 初始化card数组
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        print("chosen index: \(index)")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard {
                if matchIndex != index {
                    if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = nil
                }
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }

        for i in 0..<2*numberOfPairsOfCards {
            let currentRandom = Int(arc4random_uniform(UInt32(2*numberOfPairsOfCards-1)))
            let cardCurrent = cards[i]
            cards[i] = cards[currentRandom]
            cards[currentRandom] = cardCurrent
         }
    }
}
