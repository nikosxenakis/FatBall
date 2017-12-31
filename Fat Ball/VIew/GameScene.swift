//
//  GameScene.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 11/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var terrain: Terrain?
    var score: Score?
    var startLabel: Label?
    var endLabel: Label?
    var player: Player?
    var obstacleList: [SKSpriteNode] = []
    
    override func didMove(to view: SKView) {
        
        //view.showsPhysics = true
        
        //physics
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0 )
        physicsWorld.contactDelegate = self
        
        SpritesHolder.initialize(gameScene: self)
        //terrain
        terrain = Terrain(text: "terrain", width: size.width, height: size.height)
       
        //score
        //score = Score()
        
        startLabel = Label(text: "Tap to begin")
        endLabel = Label(text: "You lose")
        endLabel?.hide()
        
        //player
        player = Player(text: "colorfulBall", width: size.width, height: size.height)
        
        ObstaclesHolder.initialize(gameScene: self)
        
        SpritesHolder.printSprites()
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

        if( (firstBody.categoryBitMask == PhysicsCategories.Ball ) &&
            (secondBody.categoryBitMask == PhysicsCategories.Wall ) || (firstBody.categoryBitMask == PhysicsCategories.Wall ) &&
            (secondBody.categoryBitMask == PhysicsCategories.Ball )
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
        
        if( (firstBody.categoryBitMask == PhysicsCategories.Ball ) &&
            (secondBody.categoryBitMask == PhysicsCategories.Wall )
            ){
            //print("Ball & Wall");
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if(gameState == GameStates.Start){
            return
        }
        if(gameState == GameStates.End){
            return
        }
        
        AI.run(currentTime)
        
        ObstaclesHolder.update()

        ObstaclesHolder.destroy()

        SpritesHolder.update()

    }

}
