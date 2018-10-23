//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by 黄之信 on 2018/10/18.
//  Copyright © 2018年 MichaelHuang. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {

    var backgroundImage: UIImage? { didSet { setNeedsDisplay() } }
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }
}
