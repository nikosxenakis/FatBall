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
    
    static func addObstacle(pos: UInt32, width: CGFloat, height: CGFloat){
        
        let obstacle: Obstacle = Obstacle(gameScene: instance.gameScene!, position: pos, width: width, height: height)
        
        instance.obstaclesList.append(obstacle)
        
    }
    
    static func update(){
        for obstacle in instance.obstaclesList {
            obstacle.update()
        }
    }
    
}
