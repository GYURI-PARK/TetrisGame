//
//  RotationButton.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/14.
//

import Foundation
import SpriteKit

class RotationButton{
    
    let btn = SKSpriteNode()
    init() {
        btn.texture = SKTexture(imageNamed: "rotaion_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "rotation"
        btn.zPosition = 1
        btn.position = CGPoint(x: Int(Variables.scene.frame.width) / 2 , y: -Int(Variables.scene.frame.height) + 50)
        Variables.scene.addChild(btn)
    }
    
    func brickRoation(){
        if isRotatable(){
            let sinX = CGFloat(1)
            let cosX = CGFloat(0)
            var rotatedBrick = Array<CGPoint>()
            // 블럭 이미지 회전
            var action = SKAction()
            for item in Variables.brickArrays{
                let r = item.y
                let c = item.x
                let currentX = Int(item.x) + Variables.dx
                let currentY = Int(item.y) + Variables.dy
                // 현재 블럭위치에 해당하는 배열값을 0으로 변경
                Variables.backarrays[currentY][currentX] -= 1
                let newBrickX = (c * cosX) - (r * sinX)
                let newBrickY = (c * sinX) + (r * cosX)
                rotatedBrick.append(CGPoint(x: newBrickX, y: newBrickY))
                
                // 회전한 블럭의 위치에 값 +1 해주기
                let newX = Int(newBrickX) + Variables.dx
                let newY = Int(newBrickY) + Variables.dy
                Variables.backarrays[newY][newX] += 1
                
                let xValue = Int(newX) * Variables.brickValue.brickSize + Int(Variables.startPoint.x)
                let yValue = Int(newY) * Variables.brickValue.brickSize + Int(Variables.startPoint.y)

            }
            
            Variables.brickArrays = rotatedBrick
        }
        for item in Variables.backarrays{
            print(item)
        }
    }
    
    func isRotatable() -> Bool{
        return true
    }
    
}