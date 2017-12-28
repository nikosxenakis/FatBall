//
//  Terrain.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 13/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

class Terrain{
    
    var background: SKSpriteNode
    var gameScene: GameScene
    var width: CGFloat
    var height: CGFloat
    
    init(gameScene: GameScene, width: CGFloat, height: CGFloat){
        //self.background = SKSpriteNode(imageNamed: "background")
        self.background = SKSpriteNode()

        self.background.color = UIColor(red: 0.0, green: 0.1, blue: 0.1, alpha: 1.0)
        self.gameScene = gameScene
        self.width = width
        self.height = height
        
        background.isHidden = false
        
        //size
        background.size.width = width
        background.size.height = 10*height
        
        //position
        background.position = CGPoint(x: width/2, y: 0)//height*0.75)
        background.zPosition = -1
        
        //physics
        background.physicsBody?.isDynamic = false
        
        background.physicsBody = SKPhysicsBody()
        
        background.physicsBody?.categoryBitMask = PhysicsCategory.Wall
        background.physicsBody?.contactTestBitMask = PhysicsCategory.Ball
        background.physicsBody?.collisionBitMask = PhysicsCategory.None
        
        background.physicsBody?.velocity = CGVector(dx: 0.0, dy: -100.0 )
        
        //add to scene
        gameScene.addChild(background)
        
        //borders
        let borderBody = SKPhysicsBody(edgeLoopFrom: gameScene.frame)
        borderBody.categoryBitMask = PhysicsCategory.Wall
        borderBody.contactTestBitMask = PhysicsCategory.Ball
        borderBody.collisionBitMask = PhysicsCategory.Ball
        
        borderBody.friction = 0
        gameScene.physicsBody = borderBody
    }
    
    func update(){
        
         background.physicsBody?.velocity = CGVector(dx: 0.0, dy: -100.0 )

        if(background.position.y <= -background.size.height/2+self.height){
                background.position.y = 0
        }
        
    }
}
