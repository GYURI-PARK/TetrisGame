//
//  BrickGenerator.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/02.
//

import Foundation
import SpriteKit

class BrickGenerator {
    
    let brickValue = Variables.brickValue
    init() {
        let brick = brickValue.points
        for item in brick {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            
            // Arrary에 값 입력
            Variables.backarrays[y][x] = 1
            
            // 블럭 화면에 띄우기
            let xValue = x * brickValue.brickSize
            let yValye = y * brickValue.brickSize
            let brick = SKSpriteNode()
            
        }
        
    }
}
