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
    
    var label: SKLabelNode!
    
    init(text: String){
        super.init(id: text)

        self.label = SKLabelNode(fontNamed: "Chalkduster")
        
        self.label.text = text
        
        //self.label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        //self.label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center

        self.label.position = CGPoint(x: SpritesHolder.getGameScene().size.width * 0.5, y: SpritesHolder.getGameScene().size.height * 0.5)

        self.label.isHidden = false

        self.label.zPosition = 100
        
        SpritesHolder.getGameScene().addChild(self.label)
        SpritesHolder.addSprite(sprite: self)
    }
    
    func show(){
        self.label.isHidden = false
    }
    
    func hide(){
        self.label.isHidden = true
    }
}
