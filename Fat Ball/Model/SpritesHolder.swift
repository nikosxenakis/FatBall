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
        self.gameScene = nil
    }
    
    static func getGameScene() -> GameScene{
        return instance.gameScene!
    }
    
    static func initialize(gameScene: GameScene){
        instance.gameScene = gameScene
    }
    
    static func addSprite(sprite: SpriteObject){
        
        instance.spritesList.append(sprite)
        
    }
    
    static func getSprite(id: String) -> SpriteObject{
  
        return instance.spritesList.filter{$0.id == id}[0]

    }
}
