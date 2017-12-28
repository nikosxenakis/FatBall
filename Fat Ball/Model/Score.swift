//
//  Score.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 22/04/2017.
//  Copyright © 2017 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

class Score{
    
    var scoreLabel: SKLabelNode!
    
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    init(){
        self.scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        self.scoreLabel.text = "Score: 0"

        self.scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        
        self.scoreLabel.position = CGPoint(x: 10, y: 10)
        
        self.scoreLabel.zPosition = 100
        SpritesHolder.getGameScene().addChild(self.scoreLabel)
        
    }

    func update(){
        self.score+=1
    }
}
