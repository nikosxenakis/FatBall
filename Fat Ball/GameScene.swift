//
//  GameScene.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 11/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let Ball   : UInt32 = 1
    static let Wall: UInt32 = 2
    static let Background: UInt32 = 3
    static let PowerUp   : UInt32 = 4
    static let All       : UInt32 = UInt32.max
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var terrain: Terrain?
    var score: Score?
    var player: Player?
    var obstacleList: [SKSpriteNode] = []

    override func didMove(to view: SKView) {
        
        //view.showsPhysics = true
        
        //physics
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0 )
        physicsWorld.contactDelegate = self
        
        //terrain
        terrain = Terrain(gameScene: self, width: size.width, height: size.height, hidden: true)
       
        //score
        score = Score(gameScene: self)
        
        //player
        player = Player(gameScene: self, width: size.width, height: size.height)
        
        ObstaclesHolder.initialize(gameScene: self)
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        player?.touchEvent()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        //print("didBegin");
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }

        if( (firstBody.categoryBitMask == PhysicsCategory.Ball ) &&
            (secondBody.categoryBitMask == PhysicsCategory.Wall )
            ){
            //print("Ball & Wall");
            
            player?.startContact(contact)
            
        }

    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
        //print("didEnd");
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if( (firstBody.categoryBitMask == PhysicsCategory.Ball ) &&
            (secondBody.categoryBitMask == PhysicsCategory.Wall )
            ){
            //print("Ball & Wall");
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        AI.run(currentTime)
        
        ObstaclesHolder.update()

        player?.update()

        terrain?.update()

        score?.update()

    }

}
