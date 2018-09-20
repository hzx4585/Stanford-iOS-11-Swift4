//
//  ViewController.swift
//  PlayingCard
//
//  Created by 黄之信 on 2018/9/20.
//  Copyright © 2018年 MichaelHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }
}

