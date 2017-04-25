//
//  Player.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 13/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

struct Direction {
    static let None : UInt8 = 000
    static let Right : UInt8 = 001
    static let Left : UInt8 = 010
}

class Player{
    
    var player: SKSpriteNode
    var gameScene: GameScene
    var width: CGFloat
    var height: CGFloat
    var direction = Direction.None

    init(gameScene: GameScene, width: CGFloat, height: CGFloat){
        self.player = SKSpriteNode(imageNamed: "ball")
        self.player.name = "Ball"
        
        self.gameScene = gameScene
        self.width = width
        self.height = height
        
        //size
        player.size.width = 80
        player.size.height = 80
        
        //position
        player.position = CGPoint(x: width * 0.5, y: height * 0.25)
        player.zPosition = 1
        
        //physics
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        
        player.physicsBody?.usesPreciseCollisionDetection = true
        
        player.physicsBody?.categoryBitMask = PhysicsCategory.Ball
        player.physicsBody?.contactTestBitMask = PhysicsCategory.Wall
        player.physicsBody?.collisionBitMask = PhysicsCategory.Wall
        
        player.physicsBody?.allowsRotation = false
        
        //add to scene
        gameScene.addChild(player)
    }
    
    func update(){
        player.position = CGPoint(x: player.position.x, y: height * 0.25)
        player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 0.0 )
    }
    
    func touchEvent(){
        //na efarmosw taxitita
        if(direction == Direction.None || direction == Direction.Left){
            direction = Direction.Right
            
            player.physicsBody?.velocity = CGVector(dx: 190.0, dy: 0.0 )
        }
        else{
            direction = Direction.Left
            
            player.physicsBody?.velocity = CGVector(dx: -190.0, dy: 0.0 )
        }
    }
    
    func startContact(_ contact: SKPhysicsContact){
        
        let scale = self.player.xScale
        
        if(scale < 0.2){
            print("End Game")
            return
        }
        
        self.player.run(SKAction.scale(to: scale - 0.1 , duration: 1))
        
        
        let path = Bundle.main.path(forResource: "Spark", ofType: "sks")
        let rainParticle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
        
        
        
        
        
        rainParticle.name = "rainParticle"
        rainParticle.zPosition = 1
        
        rainParticle.numParticlesToEmit = 100

        
        print(contact.bodyA)
       // print(contact.bodyB)

        let w = contact.bodyA.node?.frame.width
        let h = contact.bodyA.node?.frame.height
        
        let angle = acos(h!/(2*w!))*180/3.14
        let range: CGFloat = 40.0
        
        print(w, h, angle)
        
        rainParticle.emissionAngle = angle + 180 + range/2
        rainParticle.emissionAngleRange = range
        //rainParticle.particleBirthRate = 80
        
        rainParticle.targetNode = self.player
        
        let newX = contact.contactPoint.x - self.player.position.x
        let newY = contact.contactPoint.y - self.player.position.y
        
        rainParticle.position = CGPoint(x: newX, y: newY)

        rainParticle.targetNode = gameScene;
        
        self.player.addChild(rainParticle)
        
    }
  
    func endContact(){
    }
}
