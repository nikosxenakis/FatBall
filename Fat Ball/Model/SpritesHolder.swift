//
//  SpritesHolder.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 28/12/2017.
//  Copyright © 2017 Nikos Xenakis. All rights reserved.
//

import Foundation

class SpritesHolder{
    
    static let instance = SpritesHolder()
    
    private var spritesList: [SpriteObject]
    private var gameScene: GameScene?
    
    init(){
        self.spritesList = []
    }
    
    static func getGameScene() -> GameScene{
        return instance.gameScene!
    }
    
    static func initialize(gameScene: GameScene){
        instance.gameScene = gameScene
    }
    
    static func addSprite(spriteObject: SpriteObject){
        instance.gameScene!.addChild(spriteObject.sprite)
        instance.spritesList.append(spriteObject)
    }
    
    static func getSprite(id: String) -> SpriteObject{
        return instance.spritesList.filter{$0.getId() == id}[0]
    }
    
    static func printSprites(){
        print("Sprites id:")
        for sprite in instance.spritesList {
            sprite.printSprite()
        }
    }
    
    static func stop(){
        for sprite in instance.spritesList {
            sprite.stop()
        }
    }
    
    static func update(){
        for sprite in instance.spritesList {
            sprite.update()
        }
        /*
        player?.update()
        
        terrain?.update()
        
        score?.update()*/
    }
}
