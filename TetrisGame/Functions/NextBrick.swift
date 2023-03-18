//
//  NextBrick.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/18.
//

import Foundation
import SpriteKit

class NextBrick {
    
    func addBrick() {
        // 변수 초기화
        Variables.nodeGroup.removeAll()
        Variables.newBrickArrays.removeAll()
        
        var xValue : CGFloat = 0
        for i in 0..<10{
            xValue += 100
            brickGenerator(brickSpace: xValue)
        }
        for bricks in Variables.nodeGroup{
            for item in bricks{
                Variables.scene.addChild(item)
            }
        }
    }
    
    func brickGenerator(brickSpace : CGFloat){
        let yPosition : CGFloat = 50
        let blockValue = Brick().bricks()
        var nextBricksArrays = Array<SKSpriteNode>()
        for item in blockValue.points{
            let brick = SKSpriteNode()
            let x = item.x
            let y = item.y
            brick.size = CGSize(width: CGFloat(blockValue.brickSize / 2) - 2, height: CGFloat(blockValue.brickSize / 2) - 2)
            brick.color = blockValue.color
            brick.name = "nextBrick"
            let xValue = x * CGFloat(blockValue.brickSize / 2) + brickSpace - 50
            let yValue = y * CGFloat(blockValue.brickSize / 2) + yPosition
            brick.position = CGPoint(x: xValue, y: -yValue)
            nextBricksArrays.append(brick)
        }
        Variables.nodeGroup.append(nextBricksArrays)
        Variables.newBrickArrays.append(blockValue)
    }
    
    func nextBrickMoveLeft(){
        // 1. 블럭 삭제 2. 블럭 이동 3. 블럭 삽입
        
        // 배열 첫번째 요소 삭제
        Variables.newBrickArrays.remove(at: 0)
        for item in Variables.nodeGroup.first! {
            item.removeFromParent()
        }
        Variables.nodeGroup.remove(at: 0) // 데이터도 삭제
        
        // 왼쪽으로 이동
        let action = SKAction.moveBy(x: -100, y: 0, duration: 1)
        for bricks in Variables.nodeGroup{
            for item in bricks{
                item.run(action)
            }
        }
        
        // 마지막 블럭 생성
        brickGenerator(brickSpace: 1000)
        for item in Variables.nodeGroup.last!{
            Variables.scene.addChild(item)
        }
    }
}
