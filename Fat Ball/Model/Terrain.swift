//
//  Terrain.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 13/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

class Terrain: SpriteObject{
    
    var width: CGFloat
    var height: CGFloat
    
    init(text: String, width: CGFloat, height: CGFloat){
        
        self.width = width
        self.height = height
        
        //SKSpriteNode(imageNamed: "background")
        super.init(id: text, sprite: SKSpriteNode())
        
        (self.sprite as! SKSpriteNode).color = UIColor(red: 0.0, green: 0.1, blue: 0.1, alpha: 1.0)

        //size
        (self.sprite as! SKSpriteNode).size.width = width
        (self.sprite as! SKSpriteNode).size.height = 2*height

        //position
        self.sprite.position = CGPoint(x: width/2, y: 0)
        self.setZPosition(physicsCategory: PhysicsCategories.Wall)

        //physics
        self.sprite.physicsBody = SKPhysicsBody()
        self.sprite.physicsBody?.isDynamic = false
        self.sprite.physicsBody?.velocity = CGVector(dx: 0.0, dy: -TERRAIN_SPEED )
        
        //borders
        let borderBody = SKPhysicsBody(edgeLoopFrom: SpritesHolder.getGameScene().frame)
        
        borderBody.categoryBitMask = PhysicsCategories.Wall
        borderBody.contactTestBitMask = PhysicsCategories.Ball
        borderBody.collisionBitMask = PhysicsCategories.None
        
        borderBody.friction = 0

        SpritesHolder.getGameScene().physicsBody = borderBody
    }
    
    override func update(){
        
        if(self.sprite.position.y <= -(self.sprite as! SKSpriteNode).size.height/2+self.height){
                self.sprite.position.y = 0
        }
        
    }

}
