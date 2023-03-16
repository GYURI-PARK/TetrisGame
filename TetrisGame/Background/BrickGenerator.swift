//
//  BrickGenerator.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/02.
//

import Foundation
import SpriteKit

class BrickGenerator {
    
    
    init() {
        
        // 새로 생성될 때 블럭 위치 설정
        Variables.dx = 4
        Variables.dy = 2
        Variables.brickValue = Brick().bricks()
        
        let brickValue = Variables.brickValue
        let brick = brickValue.points
        Variables.brickArrays = brick
        Variables.brickNode.removeAll()
        for item in brick {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            
            // Arrary에 값 입력
            Variables.backarrays[y][x] = 1
            
            // 블럭 화면에 띄우기
            let xValue = x * brickValue.brickSize + Int(Variables.startPoint.x)
            let yValue = y * brickValue.brickSize + Int(Variables.startPoint.y)
            let brick = SKSpriteNode()
            brick.color = brickValue.color
            brick.size = CGSize(width: brickValue.brickSize - Variables.gap, height: brickValue.brickSize - Variables.gap)
            brick.name = brickValue.brickName
            brick.zPosition = brickValue.zPosition
            brick.position = CGPoint(x: xValue, y: -yValue)
            Variables.scene.addChild(brick)
            Variables.brickNode.append(brick)
        }
        
    }
}
