//
//  Label.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 28/12/2017.
//  Copyright © 2017 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

class Label: SpriteObject{
    
    init(text: String){
        
        super.init(id: text, sprite: SKLabelNode(fontNamed: "Chalkduster"))
        
        (self.sprite as! SKLabelNode).text = text
        
        self.sprite.position = CGPoint(x: SpritesHolder.getGameScene().size.width * 0.5, y: SpritesHolder.getGameScene().size.height * 0.5)

        self.setZPosition(physicsCategory: PhysicsCategories.Label)

    }
    
}
