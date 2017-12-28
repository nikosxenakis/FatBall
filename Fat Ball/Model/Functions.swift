//
//  Functions.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 13/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


private func random() -> CGFloat {
    return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
}

func random(min: CGFloat, max: CGFloat) -> CGFloat {
    return random() * (max - min) + min
}
