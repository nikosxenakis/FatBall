//
//  Obstacle.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 15/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

struct ObstaclePosition {
    static let Right : UInt32 = 0
    static let Left : UInt32 = 1
}

class Obstacle{
    
    var obstacle: SKSpriteNode
    var gameScene: GameScene
    var position = ObstaclePosition.Left
    var width: CGFloat
    var height: CGFloat
    
    init(gameScene: GameScene, position: UInt32, width: CGFloat, height: CGFloat){
        
        self.obstacle = SKSpriteNode(imageNamed: "obstacle")
        //self.obstacle = SKSpriteNode(imageNamed: "obstacleWood")

        
        self.gameScene = gameScene
        self.position = position
        self.width = width
        self.height = height
        
        obstacle.physicsBody?.isDynamic = false
        
        obstacle.zPosition = 1
        
        obstacle.size.height = height
        
        obstacle.size.width = width
        
        obstacle.physicsBody = SKPhysicsBody(texture: obstacle.texture!, size: obstacle.size)
        
        var pos: CGFloat = 0

        if(self.position == ObstaclePosition.Right){
            pos = gameScene.size.width
        }
        
        obstacle.position = CGPoint(x: pos, y: +gameScene.size.height+height/2)
        
        
        obstacle.physicsBody?.usesPreciseCollisionDetection = true
        
        obstacle.physicsBody?.categoryBitMask = PhysicsCategory.Wall
        obstacle.physicsBody?.contactTestBitMask = PhysicsCategory.Ball
        obstacle.physicsBody?.collisionBitMask = PhysicsCategory.None
        
        gameScene.addChild(obstacle)

        self.obstacle.physicsBody?.velocity = CGVector(dx: 0.0, dy: -100.0 )

    }
    
    func update(){
        self.obstacle.physicsBody?.velocity = CGVector(dx: 0.0, dy: -100.0 )
    }
    
}
