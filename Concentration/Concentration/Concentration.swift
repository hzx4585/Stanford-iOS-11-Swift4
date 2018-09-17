//
//  Concentration.swift
//  Concentration
//
//  Created by 黄之信 on 2018/9/12.
//  Copyright © 2018年 MichaelHuang. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards =  [Card]() // 初始化card数组
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        print("chosen index: \(index)")
        assert(cards.indices.contains(index), "chosen index not in the range")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard {
                if matchIndex != index {
                    if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    cards[index].isFaceUp = true
                }
            } else {
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
            let currentRandom = (2*numberOfPairsOfCards-1).arc4random
            let cardCurrent = cards[i]
            cards[i] = cards[currentRandom]
            cards[currentRandom] = cardCurrent
         }
    }
}

extension Int {
    var arc4random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
