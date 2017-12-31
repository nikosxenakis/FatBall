//
//  ObstaclesHolder.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 15/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

class ObstaclesHolder{
    
    static let instance = ObstaclesHolder()
    
    private var obstaclesList: [Obstacle]
    private var gameScene: GameScene?
    
    init(){
        self.obstaclesList = []
        self.gameScene = nil
    }
    
    static func initialize(gameScene: GameScene){
        instance.gameScene = gameScene
    }
    
    static func addObstacle(pos: ObstaclePosition, width: CGFloat, height: CGFloat, obstacleName: String){
        
        let obstacle: Obstacle = Obstacle(position: pos, width: width, height: height, obstacleName: obstacleName)
        
        instance.obstaclesList.append(obstacle)
        
    }
    
    static func update(){
        for obstacle in instance.obstaclesList {
            obstacle.update()
        }
    }
    
    static func stop(){
        for obstacle in instance.obstaclesList {
            obstacle.stop()
        }
    }
    
    static func destroy(){
        for obstacle in instance.obstaclesList {
            if(obstacle.sprite.position.y < -(obstacle.sprite as! SKSpriteNode).size.height/2){
                let index = instance.obstaclesList.index{$0 === obstacle}
                instance.obstaclesList.remove(at: index!)
                obstacle.destroy()
            }
        }
    }
}
