//
//  GameState.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 28/12/2017.
//  Copyright © 2017 Nikos Xenakis. All rights reserved.
//

import Foundation

struct GameState {
    static let Start : UInt8 = 000
    static let Playing : UInt8 = 001
    static let End : UInt8 = 010
    
}

var gameState : UInt8 = GameState.Start
