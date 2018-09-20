//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by 黄之信 on 2018/9/20.
//  Copyright © 2018年 MichaelHuang. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}

extension Int {
    var arc4random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
