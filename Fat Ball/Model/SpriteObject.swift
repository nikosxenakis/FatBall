//
//  SpriteObject.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 28/12/2017.
//  Copyright © 2017 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

class SpriteObject {
    private var id: String
    var sprite: SKNode
    
    init(id: String, sprite: SKNode) {
        self.id = id
        self.sprite = sprite
        
        SpritesHolder.addSprite(spriteObject: self)
        
        self.show()
    }
    
    func getId() -> String{
        return self.id
    }
    func show(){
        self.sprite.isHidden = false
    }
    
    func hide(){
        self.sprite.isHidden = true
    }
    
    func stop(){
        self.sprite.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0 )
    }
    
    func setZPosition(physicsCategory: PhysicsCategory){
        self.sprite.zPosition = CGFloat(physicsCategory)
        print(self.sprite.zPosition)
    }
    
    func printSprite(){
        print("id = \(self.id), zPosition = \(self.sprite.zPosition)")
    }
    
    func update(){}
}
