//
//  Player.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 13/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

typealias Direction = UInt8

struct Directions {
    static let None : Direction = 0
    static let Right : Direction = 1
    static let Left : Direction = 2
}

class Player: SpriteObject{
    
    var width: CGFloat
    var height: CGFloat
    var direction = Directions.None
    
    init(text: String, width: CGFloat, height: CGFloat){
    
        self.width = width
        self.height = height
        
        super.init(id: text, sprite: SKSpriteNode(imageNamed: text))
        
        //size
        (self.sprite as! SKSpriteNode).size.width = 100
        (self.sprite as! SKSpriteNode).size.height = 100
        
        //position
        self.sprite.position = CGPoint(x: width * 0.5, y: height * 0.25)
        
        self.setZPosition(physicsCategory: PhysicsCategories.Ball)
                
        //physics
        self.sprite.physicsBody = SKPhysicsBody(texture: (self.sprite as! SKSpriteNode).texture!, size: (self.sprite as! SKSpriteNode).size)
        
        self.sprite.physicsBody?.usesPreciseCollisionDetection = true
        
        self.sprite.physicsBody?.categoryBitMask = PhysicsCategories.Ball
        self.sprite.physicsBody?.contactTestBitMask = PhysicsCategories.Wall
        self.sprite.physicsBody?.collisionBitMask = PhysicsCategories.None
        
        self.sprite.physicsBody?.allowsRotation = false
        
    }
    
    override func update(){
        self.sprite.position = CGPoint(x: self.sprite.position.x, y: height * 0.25)
        self.sprite.physicsBody?.velocity = CGVector(dx: self.sprite.physicsBody!.velocity.dx, dy: 0.0 )
    }
    
    
    func touchEvent(){
        if(gameState == GameStates.Start){
            let startLabel = SpritesHolder.getSprite(id: "Tap to begin") as! Label
            startLabel.hide()
            
            gameState = GameStates.Playing
        }
        if(gameState == GameStates.End){
            return
        }
        
        //na efarmosw taxitita
        if(direction == Directions.None || direction == Directions.Left){
            direction = Directions.Right
            
            self.sprite.physicsBody?.velocity = CGVector(dx: 190.0, dy: 0.0 )
        }
        else{
            direction = Directions.Left
            
            self.sprite.physicsBody?.velocity = CGVector(dx: -190.0, dy: 0.0 )
        }
    }
    
    func startContact(_ contact: SKPhysicsContact){
        
        let scale = self.sprite.xScale
        
        if(scale < 0.4){
            SpritesHolder.stop()
            
            SpritesHolder.getSprite(id: "You lose").show()
            gameState = GameStates.End
            print("End Game")
            return
        }
        
        self.sprite.run(SKAction.scale(to: scale - 0.1 , duration: 1))
        
        let path = Bundle.main.path(forResource: "Spark", ofType: "sks")
        let rainParticle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
        
        rainParticle.name = "rainParticle"
        rainParticle.zPosition = 100//CGFloat(PhysicsCategories.VisualEffect)

        
        rainParticle.numParticlesToEmit = 100

        print(contact.bodyA)
        print(contact.bodyB)
        
        let w = self.sprite.frame.width
        let h = self.sprite.frame.height
        
        let angle = acos(h/(2*w))*180/3.14
        let range: CGFloat = 40.0
        
        print(angle)

        rainParticle.emissionAngle = angle + 180 + range/2
        rainParticle.emissionAngleRange = range
        //rainParticle.particleBirthRate = 80
        
        rainParticle.targetNode = self.sprite
        
        let newX = contact.contactPoint.x - self.sprite.position.x
        let newY = contact.contactPoint.y - self.sprite.position.y

        rainParticle.position = CGPoint(x: newX, y: newY)

        rainParticle.targetNode = SpritesHolder.getGameScene()
        
        self.sprite.addChild(rainParticle)
        
        SpritesHolder.printSprites()

        self.touchEvent()

    }
  
    func endContact(){
    }
}
