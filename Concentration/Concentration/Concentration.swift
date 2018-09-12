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
    }
}
