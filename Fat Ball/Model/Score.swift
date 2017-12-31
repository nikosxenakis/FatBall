//
//  Score.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 22/04/2017.
//  Copyright © 2017 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

class Score: SpriteObject{
    
    var score: Int = 0 {
        didSet {
            (self.sprite as! SKLabelNode).text = "Score: \(score)"
        }
    }
    
    init(){
        
        super.init(id: "score", sprite: SKLabelNode(fontNamed: "Chalkduster"))
        
        (self.sprite as! SKLabelNode).text = "Score: 0"
        
        (self.sprite as! SKLabelNode).horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left

        self.sprite.position = CGPoint(x: 10, y: 10)
        
        self.setZPosition(physicsCategory: PhysicsCategories.Label)
        
    }

    override func update(){
        self.score+=1
    }
}
