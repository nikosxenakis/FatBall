//
//  GameState.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 28/12/2017.
//  Copyright © 2017 Nikos Xenakis. All rights reserved.
//

import Foundation

typealias GameState = UInt8

struct GameStates {
    static let Start : GameState = 000
    static let Playing : GameState = 001
    static let End : GameState = 010
    
}

var gameState : GameState = GameStates.Start
