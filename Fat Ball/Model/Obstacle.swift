//
//  Obstacle.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 15/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

typealias ObstaclePosition = UInt8

struct ObstaclePositions {
    static let Right : ObstaclePosition = 0
    static let Left : ObstaclePosition = 1
}

class Obstacle: SpriteObject{
    
    static var obstaclesNumber: UInt16 = 0;
    var position = ObstaclePositions.Left
    var width: CGFloat
    var height: CGFloat
    
    init(position: ObstaclePosition, width: CGFloat, height: CGFloat, obstacleName: String){
        
        self.position = position
        self.width = width
        self.height = height
        
        Obstacle.obstaclesNumber = Obstacle.obstaclesNumber + 1;

        super.init(id: "obstacle\(Obstacle.obstaclesNumber)", sprite: SKSpriteNode(imageNamed: obstacleName))
        
        self.sprite.name = "obstacle\(Obstacle.obstaclesNumber)"
        
        self.sprite.position = CGPoint(x: 10, y: 10)
        
        self.sprite.physicsBody?.isDynamic = false
        
        (self.sprite as! SKSpriteNode).size.height = height
        (self.sprite as! SKSpriteNode).size.width = width
        
        self.sprite.physicsBody = SKPhysicsBody(texture: (self.sprite as! SKSpriteNode).texture!, size: (self.sprite as! SKSpriteNode).size)
        
        self.setZPosition(physicsCategory: PhysicsCategories.Wall)
                
        var pos: CGFloat = 0

        if(self.position == ObstaclePositions.Right){
            pos = SpritesHolder.getGameScene().size.width
        }
        
        self.sprite.position = CGPoint(x: pos, y: SpritesHolder.getGameScene().size.height+height/2)
        
        self.sprite.physicsBody?.usesPreciseCollisionDetection = true

        self.sprite.physicsBody?.categoryBitMask = PhysicsCategories.Wall
        self.sprite.physicsBody?.contactTestBitMask = PhysicsCategories.Ball
        self.sprite.physicsBody?.collisionBitMask = PhysicsCategories.None

        self.sprite.physicsBody?.velocity = CGVector(dx: 0.0, dy: -100.0 )

    }
    
    override func update(){
        self.sprite.physicsBody?.velocity = CGVector(dx: 0.0, dy: -100.0 )
    }
    
    func destroy(){
        print("Obstacle with id: \(self.id) destroyed")
        self.sprite.removeFromParent()
    }
}
