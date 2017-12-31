//
//  AI.swift
//  Fat Ball
//
//  Created by Nikos Xenakis on 15/10/2016.
//  Copyright © 2016 Nikos Xenakis. All rights reserved.
//

import Foundation
import SpriteKit

class AI{
    
    static let instance = AI()
    static let spawnTime: TimeInterval = 2.5

    private var lastTime: TimeInterval
    private var lastPos: ObstaclePosition
    
    init(){
        self.lastTime = 0
        self.lastPos = ObstaclePositions.Right
    }
    
    static func run(_ currentTime: TimeInterval){
        
        if(currentTime - instance.lastTime > spawnTime){
            instance.lastTime = currentTime
            
            //size
            let width: CGFloat = random(min: OBSTACLE_WIDTH_MIN , max: OBSTACLE_WIDTH_MAX)
            let height: CGFloat = random(min: OBSTACLE_HEIGHT_MIN , max: OBSTACLE_HEIGHT_MAX)

            //position
            var num: CGFloat = 0.0
            var pos: ObstaclePosition = ObstaclePositions.Left
            var obstacleName: String = "brownObstacle"
            
            if(instance.lastPos == ObstaclePositions.Right){
                num = random(min: 0 , max: 1.2)
            }
            else{
                num = random(min: 0.8 , max: 2)
            }
            
            if(num < 1 ){
                pos = ObstaclePositions.Left
            }
            else{
                pos = ObstaclePositions.Right
            }
            
            //color
            let num2 = random(min: 0 , max: 3)
            
            if(num2 < 1 ){
                obstacleName = "brownObstacle"
            }
            else if(num2 < 2 ){
                obstacleName = "purpleObstacle"
            }
            else{
                obstacleName = "yellowObstacle"
            }
            
            instance.lastPos = pos
            
            ObstaclesHolder.addObstacle(pos: pos,width: width,height: height, obstacleName: obstacleName)
        }
        
        //print(currentTime.description+" "+instance.lastTime.description)
        
        /*
         //action
         run(SKAction.repeatForever(
         SKAction.sequence([
         SKAction.run(addObstacle),
         SKAction.wait(forDuration: 4)
         ])
         ))
         */

        
    }
}
