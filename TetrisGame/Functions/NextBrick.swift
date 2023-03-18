//
//  NextBrick.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/18.
//

import Foundation
import SpriteKit

class NextBrick {
    
    func brickGeneratro(brickSpace : CGFloat){
        let yPosition : CGFloat = 50
        let blockValue = Brick().bricks()
        var nextBricksArrays = Array<SKSpriteNode>()
        for item in blockValue.points{
            let brick = SKSpriteNode()
            let x = item.x
            let y = item.y
            brick.size = CGSize(width: CGFloat(blockValue.brickSize / 2) - 1, height: CGFloat(blockValue.brickSize / 2) - 1)
            brick.color = blockValue.color
            brick.name = "nextBrick"
            let xValue = x * CGFloat(blockValue.brickSize / 2) + brickSpace
            let yValue = y * CGFloat(blockValue.brickSize / 2) + yPosition
            brick.position = CGPoint(x: xValue, y: -yValue)
            nextBricksArrays.append(brick)
        }
        
    }
}
