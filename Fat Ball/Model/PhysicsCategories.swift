//
//  PhysicsCategories.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 29/12/2017.
//  Copyright © 2017 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

typealias PhysicsCategory = UInt32

struct PhysicsCategories {
    static let None: PhysicsCategory = 0
    static let Wall: PhysicsCategory = 1
    static let Ball: PhysicsCategory = 2
    static let PowerUp: PhysicsCategory = 3
    static let VisualEffect: PhysicsCategory = 4
    static let Label: PhysicsCategory = 5
}
